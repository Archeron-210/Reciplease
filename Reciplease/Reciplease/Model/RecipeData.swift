
import Foundation

struct RecipeHit: Decodable {
    var hits: [Recipe]
}

struct Recipe: Decodable {
    var recipe: RecipeDetail
}

struct RecipeDetail: Decodable {

    var recipeTitle: String
    var image: String
    var stringUrl: String
    var servings: Double
    var ingredientLines: [String]
    var totalTime: Double
    var ingredientsPreview: [IngredientDetail]
   

    var formatedTime: String {
        " \(Int(self.totalTime))min ⏱"
    }

    var formatedServings: String {
        "\(Int(self.servings)) 🍴"
    }

    var imageUrl: URL? {
        return URL(string: image)
    }

    var recipeUrl: URL? {
        return URL(string: stringUrl)
    }

    // setting coding keys to custom property names :
    private enum CodingKeys: String, CodingKey {
        case recipeTitle = "label", image, stringUrl = "url", servings = "yield", ingredientLines, totalTime, ingredientsPreview = "ingredients"
    }
}

struct IngredientDetail: Decodable {
    var food: String
}
