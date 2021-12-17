//
//  Recipes.swift
//  HelloFresh
//
//  Created by Saiefeddine HAYOUNI on 05/12/2021.
//
import UIKit

typealias Recipes = [Recipe]

// MARK: - Recipe
struct Recipe: Codable {
    let recipeId, image, name, headline: String
    let preparationMinutes: Int

    enum CodingKeys: String, CodingKey {
        case recipeId = "id"
        case name, headline, image
        case preparationMinutes = "preparation_minutes"
    }
}

