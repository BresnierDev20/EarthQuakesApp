//
//  AuthViewModel.swift
//  EarthQuakesApp
//
//  Created by Bresnier Moreno on 15/1/25.
//

import Foundation
import Factory

@Observable
class LoginViewModel {
    var container = Container.datastore
    
    var email: String = ""
    var password: String = ""
    var emailError: String = ""
    var passwordError: String = ""
    
    var isEmailValid = true
    var isPasswordValid = true
    var showModal = false
    var isLoading = false
    
    var isFormLoginValid: Bool {
        !email.isEmpty && isEmailValid &&
        !password.isEmpty && isPasswordValid
    }
    
    func validateEmail() {
        if email.isEmpty {
            isEmailValid = false
            emailError = "El correo no puede estar vacío."
        } else if !isValidEmail(email) {
            isEmailValid = false
            emailError = "Por favor, introduce un correo válido."
        } else {
            isEmailValid = true
            emailError = ""
        }
    }
    
    func validatePassword() {
        if password.isEmpty {
            isPasswordValid = false
            passwordError = "La contraseña no puede estar vacía."
        } else if password.count < 8 {
            isPasswordValid = false
            passwordError = "La contraseña debe tener al menos 8 caracteres."
        } else {
            isPasswordValid = true
            passwordError = ""
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailPattern = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        return email.range(of: emailPattern, options: .regularExpression) != nil
    }

    func isValidPassword(_ password: String) -> Bool {
        password.count >= 8
    }
    
}
