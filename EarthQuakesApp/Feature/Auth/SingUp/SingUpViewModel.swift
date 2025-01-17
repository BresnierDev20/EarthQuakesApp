//
//  SingUpViewModel.swift
//  EarthQuakesApp
//
//  Created by Bresnier Moreno on 15/1/25.
//

import Foundation
import Factory
import SwiftData

@Observable
class SingUpViewModel {
    var container = Container.datastore
    
    var email: String = ""
    var password: String = ""
    var name: String = ""
    var lastName: String = ""
    
    var isNameValid = true
    var isLastNameValid = true
    var isEmailValid = true
    var isPasswordValid = true
    var showModal = false
    var isLoading = false
    
    var nameError: String = ""
    var lastNameError: String = ""
    var emailError: String = ""
    var passwordError: String = ""

    var isFormValid: Bool {
        !name.isEmpty && isNameValid &&
        !lastName.isEmpty && isLastNameValid &&
        !email.isEmpty && isEmailValid &&
        !password.isEmpty && isPasswordValid
    }
    
    func validateName() {
        if name.isEmpty {
            isNameValid = false
            nameError = "El nombre no puede estar vacío."
        } else if !isValidName(name) {
            isNameValid = false
            nameError = "El nombre solo puede contener letras y espacios."
        } else {
            isNameValid = true
            nameError = ""
        }
    }
    
    func validateLastName() {
        if lastName.isEmpty {
            isLastNameValid = false
            lastNameError = "El apellido no puede estar vacío."
        } else if !isValidLastName(lastName) {
            isLastNameValid = false
            lastNameError = "El apellido solo puede contener letras y espacios."
        } else {
            isLastNameValid = true
            lastNameError = ""
        }
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

    func isValidName(_ name: String) -> Bool {
        name.range(of: "^[A-Za-zÁÉÍÓÚáéíóúÑñ ]+$", options: .regularExpression) != nil
    }

    func isValidLastName(_ lastName: String) -> Bool {
        lastName.range(of: "^[A-Za-zÁÉÍÓÚáéíóúÑñ ]+$", options: .regularExpression) != nil
    }

    func isValidEmail(_ email: String) -> Bool {
        let emailPattern = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        return email.range(of: emailPattern, options: .regularExpression) != nil
    }

    func isValidPassword(_ password: String) -> Bool {
        password.count >= 8
    }
    
    func saveUser(email: String, modelContext: ModelContext) {
        isLoading = true
        
       let existingUser = try? modelContext.fetch(FetchDescriptor<User>(predicate: #Predicate { $0.email == email }))
       
       if let existingUser = existingUser, !existingUser.isEmpty {
           showModal = true
           isLoading = false
           
       } else {
           let user = User(name: name, lastName: lastName, email: email, password: password)
           modelContext.insert(user)

           DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
               self.isLoading = false
               NavigationManager.push(view: HomeView())
           }
       }
   }
}

