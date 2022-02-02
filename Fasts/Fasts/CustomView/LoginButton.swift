//
//  LoginButton.swift
//  Fasts
//
//  Created by Настя on 02.02.2022.
//

import Foundation
import UIKit

class LoginButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String) {
        super.init(frame: UIScreen.main.bounds)
        setTitle(title, for: .normal)
        setup()
    }
    
    func setup() {
        setTitleColor(Colors.btnTitleActiveState, for: .normal)
       // button.titleLabel?.font = R.font.nunitoBold(size: 16)
        backgroundColor = Colors.btnBackgroundActiveState
        layer.cornerRadius = 8
        clipsToBounds = true
    }
}
