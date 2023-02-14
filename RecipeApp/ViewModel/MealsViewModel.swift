//
//  MealsViewModel.swift
//  RecipeApp
//
//  Created by Berk on 12.02.2023.
//

import Foundation

class MealsViewModel {
    
    var isLoading: ObservableObject<Bool> = ObservableObject(false)
    var cellDataSource: ObservableObject<[MealCellViewModel]> = ObservableObject(nil)
    var dataSource: MealsModel?
    
    func numberOfSection() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return self.dataSource?.meals.count ?? 0
    }
    
    func getData() {
        if isLoading.value ?? true {
            return
        }
        self.isLoading.value = true
        APICaller.getMeals { [weak self] result in
            self?.isLoading.value = false
            switch result {
            case .success(let data):
                print("Meals count: \(data.meals.count)")
                self?.dataSource = data
                self?.mapCellData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func mapCellData() {
        self.cellDataSource.value = self.dataSource?.meals.compactMap({MealCellViewModel(meal: $0)})
            }
}
