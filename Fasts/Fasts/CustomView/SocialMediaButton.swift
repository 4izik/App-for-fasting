//
//  SocialMediaButton.swift
//  Fasts
//
//  Created by Настя on 05.02.2022.
//

import Foundation
import UIKit

class SocialMediaButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(image: String) {
        super.init(frame: UIScreen.main.bounds)
        setImage(UIImage(named: "\(image).png"), for: .normal)
        setup()
    }
    
    func setup() {
        backgroundColor = .white
        layer.cornerRadius = 8
        layer.borderWidth = 2
        layer.borderColor = Colors.btnBorder.cgColor
        clipsToBounds = true
    }
}
