//
//  HomeViewModel.swift
//  EarthQuakesApp
//
//  Created by Bresnier Moreno on 15/1/25.
//

import Foundation
import Factory
import Combine

@Observable
class HomeViewModel {
    var userDtaStore = Container.datastore
    var queakeuseCase = Container.getQuakes
  
    var eartQuakes: [Features] = []
    var quakesGeo: [QuakesGeometry] = []
    
    var isLoading: Bool = true
    var isEmpty: Bool = false
    var isError: Bool = false
    
    var isMessageError: String = ""
    
    var disposables: Set<AnyCancellable> = Set()
    
    func getQuakes(startTime: String, endTime: String ){
        isLoading = true
        isError = false
        isEmpty = false
        eartQuakes = []
        
        queakeuseCase.invoke(startTime: startTime, endTime: endTime)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .finished:
                    self.isLoading = false
                    self.isEmpty = true
                    
                case .failure(let error):
                    isMessageError = "La solicitud falló con el código de estado 400"
                    isError = true
                    isLoading = false
                }
            }, receiveValue: { [weak self] response in
                guard let self = self else { return }
                let result = response.features.prefix(10)
                self.eartQuakes.append(contentsOf: result)
                
                print("Datos llegado \(response.features)")
            }).store(in: &disposables)
    }
    
    func formatearFecha(_ fecha: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: fecha)
    }
}
