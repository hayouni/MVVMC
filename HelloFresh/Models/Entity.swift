//
//  Entity.swift
//  HelloFresh
//
//  Created by Saiefeddine HAYOUNI on 06/12/2021.
//

import Foundation

typealias RecipeEntities = [RecipeEntity]

struct RecipeEntity {
    let name: String?
    let headline: String?
    let preparationMinutes: String?
    let image: URL?
    var isSelected: Bool?
}
