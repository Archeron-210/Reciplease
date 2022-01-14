
import Foundation

// MARK: -  Data mapping from JSON response

struct RecipeHit: Decodable {
    var hits: [Recipe]
}

struct Recipe: Decodable {
    var recipe: RecipeDetail
}

struct IngredientDetail: Decodable {
    var food: String
}

struct RecipeDetail: Decodable {

    var rawIdentifier: String
    var recipeTitle: String
    var image: String
    var stringUrl: String
    var servings: Double
    var ingredientLines: [String]
    var totalTime: Double
    var ingredientsPreview: [IngredientDetail]


    // setting coding keys to custom property names :
    private enum CodingKeys: String, CodingKey {
        case rawIdentifier = "uri", recipeTitle = "label", image, stringUrl = "url", servings = "yield", ingredientLines, totalTime, ingredientsPreview = "ingredients"
    }
}


// MARK: - Formating properties to conform to RecipeFormated protocol :

extension RecipeDetail: RecipeFormated {
    var urlToDirections: URL? {
        return URL(string: stringUrl)
    }

    var imageUrl: URL? {
        return URL(string: image)
    }

    var recipeName: String {
        return recipeTitle
    }

    var formatedServings: String {
      return " \(Int(servings)) 🍴"
    }

    var formatedIngredientLines: String {
        return "- " + ingredientLines.joined(separator: "\n- ")
    }

    var formatedTotalTime: String {
        return " \(Int(totalTime))min ⏱"
    }

    var formatedIngredientsPreview: String {
        let ingredientsNames = ingredientsPreview.map(\.food)
        return ingredientsNames.joined(separator: ", ")
    }

    var id: String {
        guard let substring = rawIdentifier.split(separator: "_").last else {
            return ""
        }
        let idFormated = String(substring)
        return idFormated
    }


}
