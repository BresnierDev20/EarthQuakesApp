//
//  DataContainer.swift
//  EarthQuakesApp
//
//  Created by Bresnier Moreno on 15/1/25.
//

import Factory

extension Container {
    static var quakesRepository: HomeRepository { HomeRepositorylmpl() }
//    static var authRepository: AuthRopository { AuthRepositorylmpl() }
}

