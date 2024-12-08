//
//  LoginViewModel.swift
//  UniFix
//
//  Created by Ryan Lamping on 11/24/24.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var loginStatus: String = ""
    @Published var isLoggedIn: Bool = false
    
    private var loginService = LoginService()
    
    func login() {
        loginService.login(email: email, password: password) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let token):
                    self?.isLoggedIn = true
                    self?.loginStatus = "Login successful! Token saved."
                    print("Access Token: \(token)")
                    
                case .failure :
                    self?.loginStatus = "Login failed. Please try again."
                }
            }
        }
    }
}
