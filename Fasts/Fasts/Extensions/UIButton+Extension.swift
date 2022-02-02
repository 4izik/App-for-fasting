//
//  UIButton+Extension.swift
//  Fasts
//
//  Created by Настя on 02.02.2022.
//

import Foundation
import UIKit

extension UIButton {
    
    /// Add  action to button
    func addAction(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping () -> Void) {
        addAction(UIAction { (_: UIAction) in closure() }, for: controlEvents)
    }
}
