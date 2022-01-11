
import Foundation

struct RecipeHit: Decodable {
    var hits: [Recipe]
}

struct Recipe: Decodable {
    var recipe: RecipeDetail
}

struct RecipeDetail: Decodable, Equatable {
    var label: String
    var image: String
    var url: String
    var yield: Double
    var ingredientLines: [String]
    var totalTime: Double
    var ingredients: [IngredientDetail]
   

    var formatedTime: String {
        " \(Int(self.totalTime))min ⏱"
    }

    var formatedServings: String {
        "\(Int(self.yield)) 🍴"
    }

    var imageUrl: URL? {
        return URL(string: image)
    }

    var recipeUrl: URL? {
        return URL(string: url)
    }

    static func ==(lhs: RecipeDetail, rhs: RecipeDetail) -> Bool {
        return lhs.label == rhs.label
    }
}

struct IngredientDetail: Decodable {
    var food: String
}
