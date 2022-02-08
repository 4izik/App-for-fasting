//
//  AddWaterView.swift
//  Fasts
//
//  Created by Настя on 07.02.2022.
//

import Foundation
import UIKit

class AddWaterView: UIView {
    // MARK: - Definition UIElements
    var water: Int = 250
    var didTapClose: (() -> Void)?
    var didTapAddWater: (() -> Void)?
    
        private let addWaterLabel: UILabel = {
            let label = UILabel()
            label.text = "Add water"
            label.textColor = Colors.lblWater
            label.textAlignment = .left
            label.font = UIFont.boldSystemFont(ofSize: 20)
            return label
        }()
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Close.svg"), for: .normal)
        return button
    }()
    
    let minusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Minus.svg"), for: .normal)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.backgroundColor = Colors.btnWater
        return button
    }()
    
    let waterTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.boldSystemFont(ofSize: 24)
        textField.textAlignment = .center
        textField.attributedPlaceholder = NSAttributedString(string: "250 ml", attributes:
            [NSAttributedString.Key.foregroundColor: Colors.tfPlaceholder])
        textField.textColor = Colors.tfAddGoal
        textField.backgroundColor = .white
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 2
        textField.layer.borderColor = Colors.tfBorder.cgColor
        return textField
    }()
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Plus.svg"), for: .normal)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.backgroundColor = Colors.btnWater
        return button
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.backgroundColor = Colors.btnWater
        return button
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
        addSubview(addWaterLabel)
        addSubview(closeButton)
        addSubview(minusButton)
        addSubview(waterTextField)
        addSubview(plusButton)
        addSubview(addButton)

        applyUIConstraints()
        
        plusButton.addAction { [self] in
            water += 50
            waterTextField.text = "\(water) ml"
        }
        minusButton.addAction { [self] in
            water -= 50
            waterTextField.text = "\(water) ml"
        }
        closeButton.addAction {
            self.didTapClose?()
        }
        addButton.addAction {
            self.didTapAddWater?()
        }
    }


    // MARK: - Add constraints

    private func applyUIConstraints() {
        addWaterLabel.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        waterTextField.translatesAutoresizingMaskIntoConstraints = false
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
   
        NSLayoutConstraint.activate([
            
            addWaterLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
            addWaterLabel.widthAnchor.constraint(equalToConstant: 150),
            addWaterLabel.heightAnchor.constraint(equalToConstant: 25),
            addWaterLabel.topAnchor.constraint(equalTo: topAnchor, constant: 35),
            
            closeButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -25),
            closeButton.widthAnchor.constraint(equalToConstant: 25),
            closeButton.heightAnchor.constraint(equalToConstant: 25),
            closeButton.topAnchor.constraint(equalTo: addWaterLabel.topAnchor),
            
            minusButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
            minusButton.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 30),
            minusButton.heightAnchor.constraint(equalToConstant: 50),
            minusButton.widthAnchor.constraint(equalToConstant: 50),
            
            waterTextField.leftAnchor.constraint(equalTo: minusButton.rightAnchor, constant: 15),
            waterTextField.heightAnchor.constraint(equalToConstant: 50),
            waterTextField.rightAnchor.constraint(equalTo: plusButton.leftAnchor, constant: -15),
            waterTextField.topAnchor.constraint(equalTo: minusButton.topAnchor),
            
            plusButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -25),
            plusButton.widthAnchor.constraint(equalToConstant: 50),
            plusButton.heightAnchor.constraint(equalToConstant: 50),
            plusButton.topAnchor.constraint(equalTo: minusButton.topAnchor),
            
            addButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -25),
            addButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 25),
            addButton.heightAnchor.constraint(equalToConstant: 50),
            addButton.topAnchor.constraint(equalTo: plusButton.bottomAnchor, constant: 15)
            
        ])
    }
        
}
