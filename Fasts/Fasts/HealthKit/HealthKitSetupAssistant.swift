//
//  HealthKitSetupAssistant.swift
//  Fasts
//
//  Created by Настя on 07.02.2022.
//

import HealthKit

class HealthKitSetupAssistant {
    private enum HealthkitSetupError: Error {
      case notAvailableOnDevice
      case dataTypeNotAvailable
    }
    
    class func authorizeHealthKit(completion: @escaping (Bool, Error?) -> Swift.Void) {
        guard HKHealthStore.isHealthDataAvailable() else {
          completion(false, HealthkitSetupError.notAvailableOnDevice)
          return
        }
      
        guard let stepsCount = HKObjectType.quantityType(forIdentifier: .stepCount),
        let dietaryWater = HKObjectType.quantityType(forIdentifier: .dietaryWater) else {
                completion(false, HealthkitSetupError.dataTypeNotAvailable)
                return
        }
        let healthKitTypesToRead: Set<HKObjectType> = [stepsCount, dietaryWater]
        let healthKitTypesToWrite: Set<HKSampleType> = [dietaryWater]
        
        HKHealthStore().requestAuthorization(toShare: healthKitTypesToWrite,
                                             read: healthKitTypesToRead) { (success, error) in
          completion(success, error)
        }
    }
    
    
    
}
