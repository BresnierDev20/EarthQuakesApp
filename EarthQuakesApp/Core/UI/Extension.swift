//
//  Extension.swift
//  EarthQuakesApp
//
//  Created by Bresnier Moreno on 15/1/25.
//

import SwiftUI

extension PresentationDetent {
    static let small = Self.height(290)
 
}

extension View {
    func customTextFieldWithLabel(_ label: String, errorMessage: String? = nil) -> some View {
        self.modifier(TextFieldModifier(label: label, errorMessage: errorMessage))
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func navigationHeader(title: String, onBack: @escaping () -> Void) -> some View {
          ZStack {
              Color.black
                  .ignoresSafeArea(edges: .top)
              HStack {
                  Button(action: onBack) {
                      Image(systemName: "chevron.left")
                          .foregroundColor(.white)
                          .font(.title2)
                  }
                  .padding(.leading, 16)

                  Spacer()

                  Text(title)
                      .font(.headline)
                      .foregroundColor(.white)

                  Spacer()
              }
              .padding()
          }
          .frame(height: 55)
      }
    
    func navBar(title: String, onAction: @escaping () -> Void) -> some View {
        ZStack {
            Color.black
                .ignoresSafeArea(edges: .top)
            HStack {
                Image("earth")
                    .resizable()
                    .frame(width: 30, height: 30)
                
                Text(title)
                    .font(.largeTitle)
                    .foregroundStyle(.white)

                Spacer()

                Button {
                    onAction()
                    
                } label: {
                    Label("Cerrar sesión", systemImage: "person.crop.circle.fill")
                        .tint(.white)
                }
            }
            .padding()
            .frame(height: 60)
            .shadow(color: .orange.opacity(0.4), radius: 5, x: 0, y: 2)
        }
        .frame(height: 55)
    }
}

