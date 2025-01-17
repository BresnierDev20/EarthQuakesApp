//
//  QuakesRemoteDtaSourcelmpl.swift
//  EarthQuakesApp
//
//  Created by Bresnier Moreno on 15/1/25.
//


import Combine
import Alamofire
import Foundation

class HomeRemoteDtaSourcelmpl: HomeRemoteDtaSource {
    func getQuakes(startTime: String, endTime: String) -> AnyPublisher<EarthquakeResponse, NetworkFailure> {
        guard let url = makeQuakesComponents(startTime: startTime, endTime: endTime) else {
            return Fail(error: NetworkFailure(message: "The URL provided is not valid."))
                .eraseToAnyPublisher()
        }
        return AF.request(url, method: .get)
            .publishData()
            .tryMap { response in
               guard let statusCode = response.response?.statusCode, (200...299).contains(statusCode) else {
                   throw NetworkFailure(message: "Failed with status code \(response.response?.statusCode ?? 500)")
                }
                return response.data ?? Data()
            }
            .decode(type: EarthquakeResponse.self, decoder: JSONDecoder())
            .mapError { error in
                NetworkFailure(message: error.localizedDescription, originalError: error)
            }
            .eraseToAnyPublisher()
    }
}

extension HomeRemoteDtaSourcelmpl {
    func makeQuakesComponents(startTime: String, endTime: String) -> URLComponents? {
        var urlComponents = URLComponents(string: URLDomains.shared.baseURL)
        
        let item = [
            URLQueryItem(name: "starttime", value: startTime),
            URLQueryItem(name: "endtime", value: endTime),
            URLQueryItem(name: "format", value: URLDomains.shared.format)
        ]
        
        urlComponents?.queryItems = item
        
        return urlComponents
        
    }
}
