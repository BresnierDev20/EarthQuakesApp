//
//  URLDomains.swift
//  EarthQuakesApp
//
//  Created by Bresnier Moreno on 15/1/25.
//

import Foundation

class URLDomains {
    static let shared = URLDomains()
  
    let baseURL = "https://earthquake.usgs.gov/fdsnws/event/1/query"
    let format = "geojson"
   
}

