
import Foundation

class FavoriteService {

    static let shared = FavoriteService()
    private init() {}

    var favorites = [RecipeDetail]()

    func add(recipe: RecipeDetail) {
        favorites.append(recipe)
    }

    func delete(at index: Int) {
        favorites.remove(at: index)
    }
}
