//
//  UITextFieldExtension.swift
//  coordinator-pattern
//
//  Created by B0279485 on 13/09/22.
//

import Foundation
import UIKit
import Combine

extension UITextField {
    
    var textPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap({ $0.object as? UITextField })
            .compactMap(\.text)
            .eraseToAnyPublisher()
    }
    
}
