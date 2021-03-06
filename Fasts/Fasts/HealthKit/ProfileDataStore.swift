//
//  ProfileDataStore.swift
//  Fasts
//
//  Created by Настя on 07.02.2022.
//

import HealthKit

class ProfileDataStore {
    
    class func getTodaysSteps(completion: @escaping (Double) -> Void) {
           let stepsQuantityType = HKQuantityType.quantityType(forIdentifier: .stepCount)!

           let now = Date()
           let startOfDay = Calendar.current.startOfDay(for: now)
           let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)

           let query = HKStatisticsQuery(quantityType: stepsQuantityType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, _ in
               guard let result = result, let sum = result.sumQuantity() else {
                   completion(0.0)
                   return
               }
               completion(sum.doubleValue(for: HKUnit.count()))
           }

        HKHealthStore().execute(query)
       }
}
