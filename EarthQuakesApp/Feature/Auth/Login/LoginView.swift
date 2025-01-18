//
//  ContentView.swift
//  EarthQuakesApp
//
//  Created by Bresnier Moreno on 15/1/25.
//

import SwiftUI
import SwiftData

struct LoginView: View {
    @State var viewModel = LoginViewModel()
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var presentationMode
    
    @Query(sort: \User.userID, order: .forward) var items: [User]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.orange, Color.black], startPoint: .bottomTrailing, endPoint: .topLeading)
                .ignoresSafeArea(.all)
            
            if viewModel.isLoading {
                ProgressView("")
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .scaleEffect(1.4)
            }
            
            GeometryReader { _ in
                VStack {
                    Image("earth")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 250, height: 250)
                    
                    Text("Earth Quakes")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .bold()
                        .padding(.bottom, 12)
                    
                    TextField("Ingrese su correo electronico", text: $viewModel.email)
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
                
                    Spacer()
                    
                    Button(action: {
                        viewModel.isLoading = true
                        if items.first(where: { $0.email == viewModel.email && $0.password == viewModel.password }) != nil {
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                self.viewModel.isLoading = false
                                NavigationManager.push(view: HomeView())
                                viewModel.container.storeUserKey(true)
                            }
                        } else {
                            viewModel.showModal = true
                        }
                    }) {
                        Text("Iniciar sesión")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                    }
                    .tint(viewModel.isFormLoginValid ? Color.black : Color.black.opacity(0.5))
                    .buttonStyle(.borderedProminent)
                    .padding(.bottom)
                    .sheet(isPresented: $viewModel.showModal) {
                        AuthFailureModal(accion: {
                            viewModel.showModal = false
                        }, messages: "El usuario o la contraseña que ingresaste son incorrectos.")
                        .presentationDetents([.small])
                        .presentationDragIndicator(.hidden)
                        .presentationCornerRadius(20)
                    }
                    Text("¿Ya tienes una cuenta?")
                        .bold()
                    
                    Text("Crear una Cuenta")
                        .foregroundStyle(Color.white)
                        .onTapGesture {
                            NavigationManager.push(view: SingUpView(), animated: true)
                        }
                }
                .padding()
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
}
