//
//  Recipe.swift
//  Reciplease
//
//  Created by Archeron on 04/01/2022.
//

import Foundation

struct RecipeHit: Decodable {
    var hits: [Recipe]
}

struct Recipe: Decodable {
    var recipe: [RecipeDetail]
}

struct RecipeDetail: Decodable {
    var label: String
    var image: String
    var url: String
    var yield: Double
    var ingredientLines: [String]
    var totalTime: Double
}
