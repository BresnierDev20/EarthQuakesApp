//
//  EarthquakeResponse.swift
//  EarthQuakesApp
//
//  Created by Bresnier Moreno on 15/1/25.
//

import Foundation

struct EarthquakeResponse: Codable {
    let type: String
    let metadata: Metadata
    let features: [Features]
}

// Metadata del JSON
struct Metadata: Codable {
    let generated: Int
    let url: String
    let title: String
    let status: Int
    let api: String
    let count: Int
}

// Característica individual (earthquake)
struct Features: Codable, Identifiable{
    let type: String
    let properties: Properties
    let geometry: QuakesGeometry
    let id: String
}

// Propiedades de cada característica
struct Properties: Codable {
    let mag: Double?
    let place: String
    let time: Int
    let updated: Int
    let tz: Int?
    let url: String
    let detail: String
    let felt: Int?
    let cdi: Double?
    let mmi: Double?
    let alert: String?
    let status: String
    let tsunami: Int
    let sig: Int
    let net: String
    let code: String
    let ids: String
    let sources: String
    let types: String
    let nst: Int?
    let dmin: Double?
    let rms: Double?
    let gap: Double?
    let magType: String
    let type: String
    let title: String
}

// Geometría de cada característica
struct QuakesGeometry: Codable {
    let type: String
    let coordinates: [Double]
    
    var latitudLongitud: (latitude: Double, longitude: Double)? {
        guard coordinates.count >= 2 else { return nil }
        return (latitude: coordinates[1], longitude: coordinates[0])
    }
    
    var depth: Double {
        return coordinates.indices.contains(2) ? coordinates[2] : 0.0
    }
}
