//
//  QuakesRow.swift
//  EarthQuakesApp
//
//  Created by Bresnier Moreno on 15/1/25.
//

import SwiftUI

struct QuakesRow: View {
    var quakesItem: Features
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(quakesItem.properties.title)
                        .bold()
                    
                    Spacer()
                }
                .padding(.bottom)
              
                Text("Profundidad: \(String(format: "%.2f", quakesItem.geometry.depth)) km")
                   
                if let textAfterOf = quakesItem.properties.title.components(separatedBy: "of").last?.trimmingCharacters(in: .whitespaces), let mag = quakesItem.properties.mag  {
                    
                    Text("Magnitud: \(mag)")
                    
                    Text("Lugar: \(textAfterOf)")
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

