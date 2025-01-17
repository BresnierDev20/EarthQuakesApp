//
//  AuthFailureModal.swift
//  EarthQuakesApp
//
//  Created by Bresnier Moreno on 17/1/25.
//

import SwiftUI

struct AuthFailureModal: View {
    let accion: () -> Void
    let messages: String
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 35, height: 5)
                .cornerRadius(8)
                .foregroundStyle(.black)
                .padding(.top)
        
            VStack {
                Image("denied")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(.top)
                
                Text(messages)
            }
            .bold()
            .font(.system(size: 16))
            .foregroundStyle(.black)
            .multilineTextAlignment(.center)
            .padding(.top, 10)
        
            Spacer()
            
            HStack {
                Spacer()
                
                Button {
                    accion()
                } label: {
                    Text("Inténtalo de nuevo")
                        .foregroundStyle(.white)
                }
                .frame(width: 200, height: 50)
                .background(Color.blackLite)
                .cornerRadius(10)
                
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.whiteLite)
    }
}
