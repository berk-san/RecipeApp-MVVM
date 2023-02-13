//
//  APICaller.swift
//  RecipeApp
//
//  Created by Berk on 13.02.2023.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

class APICaller {
    static func getMeals(completion: @escaping (_ result: Result<MealsModel,NetworkError>) -> Void) {
        let urlString = NetworkConstant.shared.baseUrl + NetworkConstant.shared.path
        guard let url = URL(string: urlString) else {
            completion(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            if error == nil {
                if let data = dataResponse {
                    if let resultData = try? JSONDecoder().decode(MealsModel.self, from: data) {
                        completion(.success(resultData))
                    }
                }
            } else {
                completion(.failure(.canNotParseData))
            }
        }
        .resume()
    }
}
