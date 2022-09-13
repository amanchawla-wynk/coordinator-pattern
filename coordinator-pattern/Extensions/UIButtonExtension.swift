//
//  UIButtonExtension.swift
//  coordinator-pattern
//
//  Created by B0279485 on 13/09/22.
//

import Foundation
import UIKit

extension UIButton {
    
    var isValidInput: Bool {
        get { isEnabled && backgroundColor == .systemBlue }
        set {
            backgroundColor = newValue ? .systemBlue : .systemGray
            isEnabled = newValue
        }
    }
    
}
