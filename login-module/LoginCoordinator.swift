//
//  LoginCoordinator.swift
//  coordinator-pattern
//
//  Created by B0279485 on 09/09/22.
//

import Foundation
import UIKit

class LoginCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    weak var parentCoordinator: MainCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = LoginViewController()
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    func toForgotPassword() {
        let controller = ForgotPasswordViewController()
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
}
