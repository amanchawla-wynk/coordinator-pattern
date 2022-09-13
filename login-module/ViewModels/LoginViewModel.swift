//
//  LoginViewModel.swift
//  coordinator-pattern
//
//  Created by B0279485 on 13/09/22.
//

import Foundation
import Combine

class LoginViewModel {
    
    //MARK: - Variables & Constents
    weak var coordinator: LoginCoordinator?
    
    var cancelable: Set<AnyCancellable> = []
    
    @Published var username = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    
    init(coordinator: LoginCoordinator) {
        self.coordinator = coordinator
    }
    
}

//MARK: - Validators
extension LoginViewModel {
    
    private var isUsernameValidPublisher: AnyPublisher<Bool, Never> {
        $username.map({ $0.count >= 3 }).eraseToAnyPublisher()
    }
    
    private var isPasswordValidPublisher: AnyPublisher<Bool, Never> {
        $password.map({ $0.count >= 8 }).eraseToAnyPublisher()
    }
    
    private var isPasswordMatchedPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest($password, $confirmPassword).map({ $0 == $1 }).eraseToAnyPublisher()
    }
    
    var isFormValid: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest3(isUsernameValidPublisher, isPasswordValidPublisher, isPasswordMatchedPublisher)
            .map({ $0 && $1 && $2 }).eraseToAnyPublisher()
    }
}

//MARK: - Logic
extension LoginViewModel {
    
    func tryLogin() {
        
    }
    
}

//MARK: - Navigation
extension LoginViewModel {
    
    func toForgotPassword() {
        coordinator?.toForgotPassword()
    }
    
}
