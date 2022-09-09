//
//  ProfileCoordinator.swift
//  coordinator-pattern
//
//  Created by B0279485 on 09/09/22.
//

import Foundation
import UIKit

class ProfileCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    weak var parentCoordinator: MainCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = ProfileViewController()
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    func toLogin() {
        parentCoordinator?.toLoginModule(controller: .login)
    }
}
