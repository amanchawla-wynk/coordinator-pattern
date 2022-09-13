//
//  LoginViewController.swift
//  coordinator-pattern
//
//  Created by B0279485 on 09/09/22.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Views
    private var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.alignment = .fill
        view.spacing = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var loginStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.alignment = .fill
        view.spacing = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var usernameTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "username"
        tf.textContentType = .username
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private lazy var passwordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "password"
        tf.isSecureTextEntry = true
        tf.textContentType = .newPassword
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private lazy var confirmPasswordTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "confirm password"
        tf.isSecureTextEntry = true
        tf.textContentType = .password
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
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
    
    //MARK: - Variables & Constets
    var viewModel: LoginViewModel!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        title = "Login"
        
        setupSubviews()
        setupPublishers()
    }
    
    //MARK: - Setup
    private func setupSubviews() {
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        ])
        
        stackView.addArrangedSubview(loginStackView)
        stackView.addArrangedSubview(forgotButton)
        
        loginStackView.addArrangedSubview(usernameTF)
        loginStackView.addArrangedSubview(passwordTF)
        loginStackView.addArrangedSubview(confirmPasswordTF)
        loginStackView.addArrangedSubview(loginButton)
        
        usernameTF.heightAnchor.constraint(equalToConstant: 42).isActive = true
        passwordTF.heightAnchor.constraint(equalToConstant: 42).isActive = true
        confirmPasswordTF.heightAnchor.constraint(equalToConstant: 42).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
    }
    
    private func setupPublishers() {
        usernameTF.textPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.username, on: viewModel)
            .store(in: &viewModel.cancelable)
        
        passwordTF.textPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.password, on: viewModel)
            .store(in: &viewModel.cancelable)
        
        confirmPasswordTF.textPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.confirmPassword, on: viewModel)
            .store(in: &viewModel.cancelable)
        
        viewModel.isFormValid
            .receive(on: RunLoop.main)
            .assign(to: \.isValidInput, on: loginButton)
            .store(in: &viewModel.cancelable)
    }
    
    //MARK: - Targets
    @objc func handleLoginButton() {
        viewModel.tryLogin()
    }
    
    @objc func handleforgotPasswordButton() {
        viewModel.toForgotPassword()
    }
}
