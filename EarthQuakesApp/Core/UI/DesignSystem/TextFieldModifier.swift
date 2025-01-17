//
//  TextFieldModifier.swift
//  EarthQuakesApp
//
//  Created by Bresnier Moreno on 15/1/25.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    var label: String
    var errorMessage: String? // Mensaje de error opcional

    func body(content: Content) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.caption)
                .foregroundColor(.white)
            
            content
                .padding(10)
                .foregroundStyle(Color.black)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color(.white))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(errorMessage == nil ? Color.white : Color.red, lineWidth: 1) // Color del borde según validación
                )
                .font(.body)

            if let errorMessage = errorMessage, !errorMessage.isEmpty {
                Text(errorMessage)
                    .font(.caption)
                    .foregroundColor(.red) // Mensaje de error en rojo
            }
        }
    }
}
