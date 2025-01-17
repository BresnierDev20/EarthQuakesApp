//
//  DetailView.swift
//  EarthQuakesApp
//
//  Created by Bresnier Moreno on 17/1/25.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var presentationMode
    var quakesDT: Features

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.orange, Color.black], startPoint: .bottomTrailing, endPoint: .topLeading)
                .ignoresSafeArea(.all)
            
            VStack {
                navigationHeader(title: "Detalle del Sismo", onBack: {
                    presentationMode()
                })
                
                VStack(alignment: .leading) {
                    Text(quakesDT.properties.title)
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .bold()
                        .padding(.bottom)
                    
                    if let textAfterOf = quakesDT.properties.title.components(separatedBy: "of").last?.trimmingCharacters(in: .whitespaces), let mag = quakesDT.properties.mag {
                        Text("Magnitud: \(mag)")
                            .foregroundStyle(.white)
                        
                        Text("Lugar: \(textAfterOf)")
                            .foregroundStyle(.white)
                    }
                    
                    Text("Profundidad: \(String(format: "%.2f", quakesDT.geometry.depth)) km")
                        .foregroundStyle(.white)
                    
                    if let coordenadas = quakesDT.geometry.latitudLongitud, let textAfterOf = quakesDT.properties.title.components(separatedBy: "of").last?.trimmingCharacters(in: .whitespaces) {
                        MapView(latitude: coordenadas.latitude, longitude: coordenadas.longitude, location: textAfterOf)
                            .padding(.top, 10)
                    }
                    Spacer()
                }
                .padding()
            }
        }.navigationBarHidden(true)
    }
}
