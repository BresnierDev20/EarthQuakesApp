//
//  UseCaseContainer.swift
//  EarthQuakesApp
//
//  Created by Bresnier Moreno on 15/1/25.
//

import Factory

extension Container {
    static var getQuakes: QuakesUseCase { QuakesUseCase() }
  
}
