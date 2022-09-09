//
//  MainViewController.swift
//  coordinator-pattern
//
//  Created by B0279485 on 09/09/22.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Views
    private var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.alignment = .center
        view.spacing = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var forgotButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot Password", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(handleforgotPasswordButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var profileButton: UIButton = {
        let button = UIButton()
        button.setTitle("User Profile", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(handleProfileButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - Variables & Constents
    weak var coordinator: MainCoordinator!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        title = "Main"
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        ])
        
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(forgotButton)
        stackView.addArrangedSubview(profileButton)
    }
    
    //MARK: - Targets
    @objc func handleLoginButton() {
        coordinator.toLoginModule(controller: .login)
    }
    
    @objc func handleforgotPasswordButton() {
        coordinator.toLoginModule(controller: .forgotPassword)
    }
    
    @objc func handleProfileButton() {
        coordinator.toProfileModule(controller: .profile)
    }
}
