//
//  User.swift
//  EarthQuakesApp
//
//  Created by Bresnier Moreno on 16/1/25.
//

import SwiftData
import Foundation

@Model
class User {
    var name: String
    var lastName: String
    var email: String
    var password: String
    @Attribute(.unique) var userID : String
    
    init(name: String, lastName: String, email: String, password: String, userID: String = UUID().uuidString) {
        self.name = name
        self.lastName = lastName
        self.email = email
        self.password = password
        self.userID = userID
    }
    
}
