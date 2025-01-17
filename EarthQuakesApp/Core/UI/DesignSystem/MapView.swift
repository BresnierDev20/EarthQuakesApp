//
//  MapView.swift
//  EarthQuakesApp
//
//  Created by Bresnier Moreno on 17/1/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    var latitude: Double
    var longitude: Double
    var location: String

    // Posición de la cámara (se inicializa con las coordenadas)
    @State private var cameraPosition: MapCameraPosition
    
    // Inicializador para configurar la región inicial del mapa
    init(latitude: Double, longitude: Double, location: String) {
        self.latitude = latitude
        self.longitude = longitude
        self.location = location
        self._cameraPosition = State(initialValue: .region(MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )))
    }

    var body: some View {
        Map(position: $cameraPosition) {
            Marker("\(location)", systemImage: "waveform.path.ecg", coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
                .tint(.orange)
        }
        .mapControls({
            MapPitchToggle()
        })
        .frame(height: 300)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}
