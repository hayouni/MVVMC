//
//  HomeViewModel.swift
//  HelloFresh
//
//  Created by Saiefeddine HAYOUNI on 05/12/2021.
//

import Foundation
protocol HomeViewModelProtocol {
    func numberOfItems() -> Int
    func isSelected(index: IndexPath) -> Bool
    func recipeModel(at index: IndexPath) -> RecipeEntity?
    func didSelectRecipe(index: IndexPath, isSelected: Bool)
    func fetchData(completion: @escaping (Bool) -> ())
    func canSelect(isSelected: Bool) -> Bool
}

class HomeViewModel: HomeViewModelProtocol {
    // MARK: - internal properties
    // list of recipes
    internal var items: RecipeEntities?
    internal var service: ServiceProtocol?
    
    // MARK: - public function
    init (service: ServiceProtocol) {
        self.service = service
    }

    // user did select item at index
    // update entity to get data after if we need itt
    func didSelectRecipe(index: IndexPath, isSelected: Bool) {
        //  test if selected recepies < 5
        if canSelect(isSelected: isSelected) {
            items?[index.row].isSelected = isSelected
        }
    }

    /// check if we can select the Recipe
    /// - Parameter isSelected: Bool
    /// - Returns: Bool
    func canSelect(isSelected: Bool) -> Bool {
        let selectedRecepie = items?.filter({ $0.isSelected == true })
        switch (selectedRecepie?.count ?? 0 <= 5 , isSelected) {
        case (true, _ ), (false, false ):
            return true
        default:   return false
        }
    }
    
    /// get number ofItems
    /// - Returns: Int
    func numberOfItems() -> Int {
        return items?.count ?? 0
    }

    /// get recipe Model at index
    /// - Parameter index: IndexPath
    /// - Returns: RecipeEntity
    func recipeModel(at index: IndexPath) -> RecipeEntity? {
        return items?[index.row]
    }

    /// return if the recipe is selected
    /// - Parameter index: IndexPath
    /// - Returns: <#description#>Bool
    func isSelected(index: IndexPath) -> Bool {
        return !(items?[index.row].isSelected ?? false)
    }

    /// fetch recipes List
    /// - Parameter completion: Bool
    /// - Returns: void
    func fetchData(completion: @escaping (Bool) -> ()) {
        service?.getRecepiesList { [weak self] recipes in
            self?.items = recipes
            completion(recipes != nil)
        }
    }
}
