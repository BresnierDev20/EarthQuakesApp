//
//  NetworkContainer.swift
//  EarthQuakesApp
//
//  Created by Bresnier Moreno on 15/1/25.
//

import Factory

extension Container {
    static var quakesRemoteDTSource: HomeRemoteDtaSource { HomeRemoteDtaSourcelmpl() as HomeRemoteDtaSource}
}
