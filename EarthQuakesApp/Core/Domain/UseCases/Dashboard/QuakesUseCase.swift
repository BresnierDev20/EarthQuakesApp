//
//  QuakesUseCase.swift
//  EarthQuakesApp
//
//  Created by Bresnier Moreno on 15/1/25.
//


import Combine
import Factory

class QuakesUseCase {
    var repo = Container.quakesRepository
    
    func invoke(startTime: String, endTime: String) -> AnyPublisher<EarthquakeResponse, NetworkFailure>{
        return repo.getQuakes(startTime: startTime, endTime: endTime)
           
    }
    
}
