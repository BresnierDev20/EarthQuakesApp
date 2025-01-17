//
//  QuakesRemoteDtaSource.swift
//  EarthQuakesApp
//
//  Created by Bresnier Moreno on 15/1/25.
//

import Combine

protocol HomeRemoteDtaSource {
    func getQuakes(startTime: String, endTime: String) -> AnyPublisher<EarthquakeResponse, NetworkFailure>
}
