//
//  MealCellViewModel.swift
//  RecipeApp
//
//  Created by Berk on 14.02.2023.
//

import Foundation

class MealCellViewModel {
    var id: String
    var mealName: String
    var mealImageUrl: URL?
    
    init(meal: MealDetails) {
        self.id = meal.idMeal
        self.mealName = meal.strMeal
        self.mealImageUrl = URL(string: meal.strMealThumb)
    }
}
