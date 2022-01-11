
import Foundation

class FavoriteService {

    static let shared = FavoriteService()
    private init() {}

    private(set) var favorites = [RecipeDetail]()

    func add(recipe: RecipeDetail) {
        guard !isFavorite(recipe: recipe) else {
            return
        }
        favorites.append(recipe)
    }

    func delete(recipe: RecipeDetail) {
        if let index = favorites.firstIndex(of: recipe) {
            favorites.remove(at: index)
        }
    }

    func isFavorite(recipe: RecipeDetail) -> Bool {
        return favorites.contains(recipe)
    }
}
