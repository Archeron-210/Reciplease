
import Foundation

class FavoriteService {

    static let shared = FavoriteService()
    private init() {}

    private(set) var favorites = [RecipeDetail]()

    func add(recipe: RecipeDetail) {
        favorites.append(recipe)
    }

    func delete(recipe: RecipeDetail) {
       // favorites.remove(at: index)
    }
}
