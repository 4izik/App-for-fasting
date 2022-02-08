//
//  DashboardViewController.swift
//  Fasts
//
//  Created by Настя on 06.02.2022.
//

import UIKit
import HealthKit

class DashboardViewController: UIViewController {
    var allWater = 0
    let dashboardView = DashboardView()
    var myTimer = Timer()
    var currentTime = Date()
    var compareTime = Date().addingTimeInterval(57600)
    
    var hour = 16
    var minute = 0 {
        didSet {
            if minute < 0 {
                hour -= 1
                minute = 59
            }
        }
    }
    var second = 0 {
        didSet {
            if second < 0 {
                minute -= 1
                second = 59
            }
        }
    }
    var timeLast = "00:00:00" {
        didSet {
            dashboardView.timerLabel.text = timeLast
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isModalInPresentation = true
        view.backgroundColor = .white
        setupUI()
        updateTimeFast()
    }
  
      
    private func setupUI() {
        view.addSubview(dashboardView)
        dashboardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dashboardView.widthAnchor.constraint(equalTo: view.widthAnchor),
            dashboardView.heightAnchor.constraint(equalTo: view.heightAnchor),
            dashboardView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        dashboardView.didTapAddLiquid = {
            self.showAddWater()
        }
        
        dashboardView.didTapStartFast = { [self] in
            myTimer.invalidate()
            startTimer()
            UserDefaults.standard.set(currentTime, forKey: "time")
        }
    }
    
    private func updateTimeFast() {
        var time = UserDefaults.standard.object(forKey: "time")
               if let newTime = time as? Date {
                   if Calendar.current.dateComponents([.hour, .minute, .second], from: compareTime, to: newTime) != nil {
                       let difference = Calendar.current.dateComponents([.hour, .minute, .second], from: newTime, to: compareTime)
                       hour = difference.hour!
                       minute = difference.minute!
                       second = difference.second!
                       if hour < 0 {
                           timeLast = "00:00:00"
                           myTimer.invalidate()
                       } else {
                           startTimer()
                       }
                      }
                   }
        
    }
    
    private func startTimer() {
        myTimer = Timer.scheduledTimer(timeInterval: 1,
                                       target: self,
                                       selector: #selector(updateTimerLabel),
                                       userInfo: nil, repeats: true)
    }
    
    @objc private func updateTimerLabel() {
        second -= 1
        timeLast = String(format: "%02d:%02d:%02d", hour, minute, second)
    }
    
    private func showAddWater() {
        guard let popVC = AddWaterViewController() as? AddWaterViewController else { return }

        popVC.modalPresentationStyle = .popover
        let popOverVC = popVC.popoverPresentationController
        popOverVC?.delegate = self
        popOverVC?.sourceView = self.dashboardView
        popOverVC?.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
        
        popVC.preferredContentSize = CGSize(width: 320, height: 220)
        self.present(popVC, animated: true)
        
        popVC.addwaterView.didTapAddWater = { [self] in
            allWater += popVC.addwaterView.water
            dashboardView.waterLabel.text = "\(allWater)"
            dismiss(animated: true, completion: nil)
        }
    }
  
}
extension DashboardViewController: UIPopoverPresentationControllerDelegate {

        func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
            return .none
        }
    }
