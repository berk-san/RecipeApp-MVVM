//
//  NetworkConstant.swift
//  RecipeApp
//
//  Created by Berk on 13.02.2023.
//

import Foundation

class NetworkConstant {
    static var shared: NetworkConstant = NetworkConstant()
    
    private init() {
        // Singletone
    }
    
    var apiKey: String {
        get {
            return ""
        }
    }
    
    var baseUrl: String {
        get {
            return "https://www.themealdb.com/api/json/v1/1"
        }
    }
    
    var path: String {
        get {
            return "/filter.php?c=seafood"
        }
    }
}
