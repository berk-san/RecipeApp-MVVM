//
//  MealsViewModel.swift
//  RecipeApp
//
//  Created by Berk on 12.02.2023.
//

import Foundation

class MealsViewModel {
    
    func numberOfSection() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return 10
    }
    
    func getData() {
        APICaller.getMeals { result in
            switch result {
            case .success(let data):
                print("Meals count: \(data.meals.count)")
            case .failure(let error):
                print(error)
            }
        }
    }
}
