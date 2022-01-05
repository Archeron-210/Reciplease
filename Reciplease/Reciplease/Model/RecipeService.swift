
import Foundation

class RecipeService {
    static let shared = RecipeService()
    private init() {}

    var recipes: [RecipeDetail] = []
}
