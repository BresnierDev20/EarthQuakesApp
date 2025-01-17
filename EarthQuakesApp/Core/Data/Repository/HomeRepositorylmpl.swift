//
//  HomeRepositorylmpl.swift
//  EarthQuakesApp
//
//  Created by Bresnier Moreno on 15/1/25.
//


import Combine
import Factory

class HomeRepositorylmpl: HomeRepository {
    var remote = Container.quakesRemoteDTSource
    
    func getQuakes(startTime: String, endTime: String) -> AnyPublisher<EarthquakeResponse, NetworkFailure> {
        remote.getQuakes(startTime: startTime, endTime: endTime)
    }

}
    
