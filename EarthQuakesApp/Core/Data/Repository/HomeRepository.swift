//
//  HomeRepository.swift
//  EarthQuakesApp
//
//  Created by Bresnier Moreno on 15/1/25.
//

import Combine

protocol HomeRepository {
    func getQuakes(startTime: String, endTime: String) -> AnyPublisher<EarthquakeResponse, NetworkFailure>
}
