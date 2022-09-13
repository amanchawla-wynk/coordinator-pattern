//
//  MainCoordinator.swift
//  coordinator-pattern
//
//  Created by B0279485 on 09/09/22.
//

import Foundation
import UIKit

enum LoginModuleControllers: CaseIterable {
    case login
    case forgotPassword
}

enum ProfileModuleControllers: CaseIterable {
    case profile
}

class MainCoordinator: NSObject, Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func start() {
        self.navigationController.delegate = self
        
        let controller = MainViewController()
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: false)
    }
    
    func toLoginModule(controller: LoginModuleControllers) {
        let child = LoginCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.parentCoordinator = self
        
        switch controller {
        case .login:
            child.start()
        case .forgotPassword:
            child.toForgotPassword()
        }
    }
    
    func toProfileModule(controller: ProfileModuleControllers) {
        let child = ProfileCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.parentCoordinator = self
        
        switch controller {
        case .profile:
            child.start()
        }
    }
}

extension MainCoordinator: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Read the view controller we’re moving from.
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        // Check whether our view controller array already contains that view controller. If it does it means we’re pushing a different view controller on top rather than popping it, so exit.
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        // We’re still here – it means we’re popping the view controller, so we can check whether it’s a buy view controller
        if let loginViewController = fromViewController as? LoginViewController {
            // We're popping a buy view controller; end its coordinator
            childDidFinish(loginViewController.viewModel.coordinator)
        }
    }
}
