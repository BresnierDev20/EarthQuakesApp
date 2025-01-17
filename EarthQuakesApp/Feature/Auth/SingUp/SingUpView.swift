//
//  SingUpView.swift
//  EarthQuakesApp
//
//  Created by Bresnier Moreno on 15/1/25.
//

import SwiftUI
import SwiftData


struct SingUpView: View {
    @State var viewModel = SingUpViewModel()
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var presentationMode

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.orange, Color.black], startPoint: .bottomTrailing, endPoint: .topLeading)
                .ignoresSafeArea(.all)

            if viewModel.isLoading {
                ProgressView("")
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(1.4)
            }
            VStack {
                navigationHeader(title: "Crea tu cuenta", onBack: {
                    presentationMode()
                })
                
                ScrollView {
                    VStack {                        
                        Text("Regístrate para acceder a información actualizada sobre eventos sísmicos y alertas.")
                            .foregroundStyle(.white)
                            .bold()
                            .multilineTextAlignment(.center)
                            .padding(.top,50)
      
                        TextField("Ingrese su nombre", text: $viewModel.name)
                            .customTextFieldWithLabel("Nombre", errorMessage: viewModel.isNameValid ? nil : viewModel.nameError)
                            .onChange(of: viewModel.name) { _, _ in
                                viewModel.validateName()
                            }
                            .padding(.bottom)
                            .padding(.top,50)

                        TextField("Ingrese su apellido", text: $viewModel.lastName)
                            .customTextFieldWithLabel("Apellido", errorMessage: viewModel.isLastNameValid ? nil : viewModel.lastNameError)
                            .onChange(of: viewModel.lastName) { _, _ in
                                viewModel.validateLastName()
                            }
                            .padding(.bottom)

                        TextField("Ingrese su correo electrónico", text: $viewModel.email)
                            .customTextFieldWithLabel("Correo electrónico", errorMessage: viewModel.isEmailValid ? nil : viewModel.emailError)
                            .onChange(of: viewModel.email) { _, _ in
                                viewModel.validateEmail()
                            }
                            .padding(.bottom)

                        TextField("Ingrese su contraseña", text: $viewModel.password)
                            .customTextFieldWithLabel("Contraseña", errorMessage: viewModel.isPasswordValid ? nil : viewModel.passwordError)
                            .onChange(of: viewModel.password) { _, _ in
                                viewModel.validatePassword()
                            }
                            .padding(.bottom)
                    }
                    .padding()
                }

                Button(action: {
                    viewModel.saveUser(email: viewModel.email, modelContext: modelContext)
                }) {
                    Text("Crear Cuenta")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                }
                .background(viewModel.isFormValid ? Color.black : Color.black.opacity(0.5))
                .cornerRadius(8)
                .disabled(!viewModel.isFormValid)
                .padding()
            }
            .sheet(isPresented: $viewModel.showModal) {
                AuthFailureModal(accion: {
                    viewModel.showModal = false
                }, messages: "El email ya está registrado. Usa uno diferente.")
                .presentationDetents([.small])
                .presentationDragIndicator(.hidden)
                .presentationCornerRadius(20)
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        .ignoresSafeArea(.keyboard)
        .navigationBarHidden(true)
    }
}
