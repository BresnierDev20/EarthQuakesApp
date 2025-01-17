//
//  UserDatastore.swift
//  EarthQuakesApp
//
//  Created by Bresnier Moreno on 16/1/25.
//

import Foundation

class UserDatastore {
    private let userIDKey = "userKey"
    
    //Get User
    func storeUserKey(_ user: Bool){
        UserDefaults.standard.set(user, forKey: userIDKey)
    }

    func getUserKey() -> Bool {
        return UserDefaults.standard.bool(forKey: userIDKey)
    }

    func deleteUserKey() {
        UserDefaults.standard.removeObject(forKey: userIDKey)
    }
}

