//
//  DashboardView.swift
//  Fasts
//
//  Created by Настя on 06.02.2022.
//

import Foundation
import UIKit

class DashboardView: UIView {
// MARK: - Definition UIElements
    var didTapAddLiquid:(() -> Void)?
    var didTapStartFast:(() -> Void)?
    
    private let trackerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Frame 68.svg")
        return imageView
    }()

    private let nextFastLabel: UILabel = {
        let label = UILabel()
        label.text = "until your next fast:"
        label.textColor = Colors.lblInfoDashboard
        label.textAlignment = .right
        label.font = UIFont(name: "Inter", size: 14)
        return label
    }()
    
    let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00:00"
        label.textColor = Colors.lblTimer
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 32)
        return label
    }()
    
    private let canEatLabel: UILabel = {
        let label = UILabel()
        label.text = "you can eat now"
        label.textColor = Colors.lblPassive
        label.textAlignment = .right
        label.font = UIFont(name: "Inter", size: 14)
        return label
    }()
    
    private let leftDrinkLabel: UILabel = {
        let label = UILabel()
        label.text = "left to drink:"
        label.textColor = Colors.lblInfoDashboard
        label.textAlignment = .right
        label.font = UIFont(name: "Inter", size: 14)
        return label
    }()
    
    let waterLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = Colors.lblWater
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 32)
        return label
    }()
    
    private let needWaterLabel: UILabel = {
        let label = UILabel()
        label.text = "of 3000 ml"
        label.textColor = Colors.lblPassive
        label.textAlignment = .right
        label.font = UIFont(name: "Inter", size: 14)
        return label
    }()
    
    private let leftGoLabel: UILabel = {
        let label = UILabel()
        label.text = "left to go:"
        label.textColor = Colors.lblInfoDashboard
        label.textAlignment = .right
        label.font = UIFont(name: "Inter", size: 14)
        return label
    }()
    
    let stepLabel: UILabel = {
        let label = UILabel()
        label.text = "7567"
        label.textColor = Colors.lblStep
        label.textAlignment = .right
        label.font = UIFont.boldSystemFont(ofSize: 32)
        return label
    }()
    
    private let needStepLabel: UILabel = {
        let label = UILabel()
        label.text = "of 10000 steps"
        label.textColor = Colors.lblPassive
        label.textAlignment = .right
        label.font = UIFont(name: "Inter", size: 14)
        return label
    }()
    
    private let editGoalsLabel: UILabel = {
        let label = UILabel()
        label.text = "edit goals"
        label.textColor = Colors.lblInfoDashboard
        label.textAlignment = .right
        label.font = UIFont(name: "Inter", size: 16)
        return label
    }()
    
    let editGoalsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Edit.svg"), for: .normal)
        return button
    }()
    
    private let grayLineView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.vwGrayLine
        return view
    }()
    
    private let grayLineView2: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.vwGrayLine
        return view
    }()
    
    private let grayLineView3: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.vwGrayLine
        return view
    }()
    
    let addFoodButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Food.svg"), for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = Colors.btnFood
        button.clipsToBounds = true
        return button
    }()
    
    let addLiquidButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Water.svg"), for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = Colors.btnWater
        button.clipsToBounds = true
        return button
    }()
    
    let addMoodButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Mood.svg"), for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = Colors.btnMood
        button.clipsToBounds = true
        return button
    }()
    
    let startFastButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Fast.svg"), for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = Colors.btnFast
        button.clipsToBounds = true
        return button
    }()
    
    private let tabbarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Tabbar.svg")
        imageView.contentMode = .center
        return imageView
    }()

// MARK: - Init

required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupViews()
}

init() {
    super.init(frame: UIScreen.main.bounds)
    setupViews()
}

// MARK: - Setup View

private func setupViews() {
    addSubview(trackerImageView)
    addSubview(nextFastLabel)
    addSubview(timerLabel)
    addSubview(canEatLabel)
    addSubview(grayLineView)
    addSubview(leftDrinkLabel)
    addSubview(waterLabel)
    addSubview(needWaterLabel)
    addSubview(grayLineView2)
    addSubview(leftGoLabel)
    addSubview(stepLabel)
    addSubview(needStepLabel)
    addSubview(grayLineView3)
    addSubview(editGoalsLabel)
    addSubview(editGoalsButton)
    addSubview(addFoodButton)
    addSubview(addLiquidButton)
    addSubview(addMoodButton)
    addSubview(startFastButton)
    addSubview(tabbarImageView)

    applyUIConstraints()
    setupStepHelthKit()
    
    addLiquidButton.addAction {
        self.didTapAddLiquid?()
    }
    startFastButton.addAction {
        self.didTapStartFast?()
    }
}


// MARK: - Add constraints

private func applyUIConstraints() {
    trackerImageView.translatesAutoresizingMaskIntoConstraints = false
    nextFastLabel.translatesAutoresizingMaskIntoConstraints = false
    timerLabel.translatesAutoresizingMaskIntoConstraints = false
    canEatLabel.translatesAutoresizingMaskIntoConstraints = false
    grayLineView.translatesAutoresizingMaskIntoConstraints = false
    leftDrinkLabel.translatesAutoresizingMaskIntoConstraints = false
    waterLabel.translatesAutoresizingMaskIntoConstraints = false
    needWaterLabel.translatesAutoresizingMaskIntoConstraints = false
    grayLineView2.translatesAutoresizingMaskIntoConstraints = false
    leftGoLabel.translatesAutoresizingMaskIntoConstraints = false
    stepLabel.translatesAutoresizingMaskIntoConstraints = false
    needStepLabel.translatesAutoresizingMaskIntoConstraints = false
    grayLineView3.translatesAutoresizingMaskIntoConstraints = false
    editGoalsLabel.translatesAutoresizingMaskIntoConstraints = false
    editGoalsButton.translatesAutoresizingMaskIntoConstraints = false
    addFoodButton.translatesAutoresizingMaskIntoConstraints = false
    addLiquidButton.translatesAutoresizingMaskIntoConstraints = false
    addMoodButton.translatesAutoresizingMaskIntoConstraints = false
    startFastButton.translatesAutoresizingMaskIntoConstraints = false
    tabbarImageView.translatesAutoresizingMaskIntoConstraints = false
    
    var constantHeightImage: CGFloat = 0
    var constantWeightImage:CGFloat = 0
    var distanceBtwGray: CGFloat = 0
    if UIScreen.main.bounds.height < 700 {
        constantHeightImage = 370
        constantWeightImage = 190
        distanceBtwGray = 15
    } else {
        constantWeightImage = 220
        constantHeightImage = 450
        distanceBtwGray = 30
    }
    
    NSLayoutConstraint.activate([
        trackerImageView.widthAnchor.constraint(equalToConstant: constantWeightImage),
        trackerImageView.heightAnchor.constraint(equalToConstant: constantHeightImage),
        trackerImageView.leftAnchor.constraint(equalTo: leftAnchor),
        trackerImageView.topAnchor.constraint(equalTo: topAnchor, constant: super.bounds.height/10),
        
        nextFastLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
        nextFastLabel.widthAnchor.constraint(equalToConstant: 150),
        nextFastLabel.heightAnchor.constraint(equalToConstant: 20),
        nextFastLabel.topAnchor.constraint(equalTo: trackerImageView.topAnchor),
        
        timerLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
        timerLabel.widthAnchor.constraint(equalToConstant: 150),
        timerLabel.heightAnchor.constraint(equalToConstant: 25),
        timerLabel.topAnchor.constraint(equalTo: nextFastLabel.bottomAnchor, constant: 15),
        
        canEatLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
        canEatLabel.widthAnchor.constraint(equalToConstant: 150),
        canEatLabel.heightAnchor.constraint(equalToConstant: 15),
        canEatLabel.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 10),
        
        grayLineView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
        grayLineView.widthAnchor.constraint(equalToConstant: 60),
        grayLineView.heightAnchor.constraint(equalToConstant: 2),
        grayLineView.topAnchor.constraint(equalTo: canEatLabel.bottomAnchor, constant: distanceBtwGray),
        
        leftDrinkLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
        leftDrinkLabel.widthAnchor.constraint(equalToConstant: 150),
        leftDrinkLabel.heightAnchor.constraint(equalToConstant: 15),
        leftDrinkLabel.topAnchor.constraint(equalTo: grayLineView.topAnchor, constant: distanceBtwGray),
        
        waterLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
        waterLabel.widthAnchor.constraint(equalToConstant: 150),
        waterLabel.heightAnchor.constraint(equalToConstant: 25),
        waterLabel.topAnchor.constraint(equalTo: leftDrinkLabel.bottomAnchor, constant: 15),
        
        needWaterLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
        needWaterLabel.widthAnchor.constraint(equalToConstant: 150),
        needWaterLabel.heightAnchor.constraint(equalToConstant: 15),
        needWaterLabel.topAnchor.constraint(equalTo: waterLabel.bottomAnchor, constant: 10),
        
        grayLineView2.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
        grayLineView2.widthAnchor.constraint(equalToConstant: 60),
        grayLineView2.heightAnchor.constraint(equalToConstant: 2),
        grayLineView2.topAnchor.constraint(equalTo: needWaterLabel.bottomAnchor, constant: distanceBtwGray),
        
        leftGoLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
        leftGoLabel.widthAnchor.constraint(equalToConstant: 150),
        leftGoLabel.heightAnchor.constraint(equalToConstant: 20),
        leftGoLabel.topAnchor.constraint(equalTo: grayLineView2.topAnchor, constant: distanceBtwGray),
        
        stepLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
        stepLabel.widthAnchor.constraint(equalToConstant: 150),
        stepLabel.heightAnchor.constraint(equalToConstant: 25),
        stepLabel.topAnchor.constraint(equalTo: leftGoLabel.bottomAnchor, constant: 15),
        
        needStepLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
        needStepLabel.widthAnchor.constraint(equalToConstant: 150),
        needStepLabel.heightAnchor.constraint(equalToConstant: 20),
        needStepLabel.topAnchor.constraint(equalTo: stepLabel.bottomAnchor, constant: 10),
        
        grayLineView3.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
        grayLineView3.widthAnchor.constraint(equalToConstant: 60),
        grayLineView3.heightAnchor.constraint(equalToConstant: 2),
        grayLineView3.topAnchor.constraint(equalTo: needStepLabel.bottomAnchor, constant: distanceBtwGray),
        
        editGoalsButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -25),
        editGoalsButton.widthAnchor.constraint(equalToConstant: 30),
        editGoalsButton.heightAnchor.constraint(equalToConstant: 30),
        editGoalsButton.bottomAnchor.constraint(equalTo: trackerImageView.bottomAnchor),
        
        editGoalsLabel.rightAnchor.constraint(equalTo: editGoalsButton.leftAnchor,constant: -10),
        editGoalsLabel.widthAnchor.constraint(equalToConstant: 120),
        editGoalsLabel.heightAnchor.constraint(equalToConstant: 30),
        editGoalsLabel.topAnchor.constraint(equalTo: editGoalsButton.topAnchor),
        
        addFoodButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
        addFoodButton.widthAnchor.constraint(equalToConstant: constantWeightImage/2 - 3),
        addFoodButton.topAnchor.constraint(equalTo: trackerImageView.bottomAnchor, constant: distanceBtwGray),
        addFoodButton.heightAnchor.constraint(equalToConstant: 75),
        
        addLiquidButton.leftAnchor.constraint(equalTo: addFoodButton.rightAnchor, constant: 5),
        addLiquidButton.widthAnchor.constraint(equalToConstant: constantWeightImage/2 - 3),
        addLiquidButton.topAnchor.constraint(equalTo: trackerImageView.bottomAnchor, constant: distanceBtwGray),
        addLiquidButton.heightAnchor.constraint(equalToConstant: 75),
        
        addMoodButton.leftAnchor.constraint(equalTo: leftAnchor,constant: 20),
        addMoodButton.rightAnchor.constraint(equalTo: addLiquidButton.rightAnchor),
        addMoodButton.topAnchor.constraint(equalTo: addLiquidButton.bottomAnchor, constant: 5),
        addMoodButton.heightAnchor.constraint(equalToConstant: 75),
        
        startFastButton.leftAnchor.constraint(equalTo: addLiquidButton.rightAnchor, constant: 5),
        startFastButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
        startFastButton.topAnchor.constraint(equalTo: addLiquidButton.topAnchor),
        startFastButton.bottomAnchor.constraint(equalTo: addMoodButton.bottomAnchor),
        
        tabbarImageView.leftAnchor.constraint(equalTo: leftAnchor),
        tabbarImageView.rightAnchor.constraint(equalTo: rightAnchor),
        tabbarImageView.topAnchor.constraint(equalTo: startFastButton.bottomAnchor),
        tabbarImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        
    ])
}
    
    private func setupStepHelthKit() {
        ProfileDataStore.getTodaysSteps { step in
            DispatchQueue.main.async {
                self.stepLabel.text = "\(10000-Int(step))"
              }
        }
    }
    
}
