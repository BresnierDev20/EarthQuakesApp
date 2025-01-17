//
//  NetworkFailure.swift
//  EarthQuakesApp
//
//  Created by Bresnier Moreno on 15/1/25.
//

import Foundation

struct NetworkFailure: Error {
    let message: String
    let originalError: Error?
    
    init(message: String, originalError: Error? = nil) {
        self.message = message
        self.originalError = originalError
    }
    
    // Inicializador estático para representar un error desconocido
    static func unknown(originalError: Error? = nil) -> NetworkFailure {
        return NetworkFailure(message: "Error desconocido", originalError: originalError)
    }
}
