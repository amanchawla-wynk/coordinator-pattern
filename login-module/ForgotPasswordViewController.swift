//
//  ForgotPasswordViewController.swift
//  coordinator-pattern
//
//  Created by B0279485 on 09/09/22.
//

import Foundation
import UIKit

class ForgotPasswordViewController: UIViewController {
    
    //MARK: - Variables & Constents
    weak var coordinator: LoginCoordinator!
    
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        title = "Forgot Password"
    }
    
}
