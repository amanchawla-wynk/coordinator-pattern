//
//  Coordinator.swift
//  coordinator-pattern
//
//  Created by B0279485 on 09/09/22.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
