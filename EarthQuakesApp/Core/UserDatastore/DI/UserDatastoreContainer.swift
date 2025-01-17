//
//  UserDatastoreContainer.swift
//  EarthQuakesApp
//
//  Created by Bresnier Moreno on 16/1/25.
//

import Factory

extension Container {
  static var datastore: UserDatastore { UserDatastore() }
}
