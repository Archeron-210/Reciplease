
import Foundation
import CoreData

final class FavoriteRecipeRepository {

    // MARK: - Properties

    private let coreDataStack: CoreDataStackProtocol

    // MARK: - Init

    init(coreDataStack: CoreDataStackProtocol = CoreDataStack()) {
        self.coreDataStack = coreDataStack
    }

    // MARK: - Functions

    func getRecipes() -> [RecipeFormated] {
        return getFavoriteRecipes()
    }

    func saveRecipe(recipe: RecipeFormated) {
        guard !isFavorite(recipe: recipe) else {
            return
        }
        let favoriteRecipe = FavoriteRecipe(context: coreDataStack.viewContext)
        favoriteRecipe.image = recipe.imageUrl?.absoluteString
        favoriteRecipe.ingredientLines = recipe.formatedIngredientLines
        favoriteRecipe.ingredientsPreview = recipe.formatedIngredientsPreview
        favoriteRecipe.recipeTitle = recipe.recipeName
        favoriteRecipe.servings = recipe.formatedServings
        favoriteRecipe.totalTime = recipe.formatedTotalTime
        favoriteRecipe.stringUrl = recipe.urlToDirections?.absoluteString
        favoriteRecipe.rawIdentifer = recipe.id

        do {
            try coreDataStack.viewContext.save()
        } catch {
            print("We were unable to save this recipe to favorites")
        }
    }

    func deleteRecipe(recipe: RecipeFormated) {
        let searchRecipe = getFavoriteRecipes().first(where: { (favoriteRecipe) -> Bool in
            return favoriteRecipe.id == recipe.id
        })
        // Unwrapping search result :
        guard let favoriteRecipe = searchRecipe else {
            return
        }

        coreDataStack.viewContext.delete(favoriteRecipe)

        do {
            try coreDataStack.viewContext.save()
        } catch {
            print("We were unable to delete this recipe from favorites")
        }
    }

    func isFavorite(recipe: RecipeFormated) -> Bool {
        let searchRecipe = getFavoriteRecipes().first(where: { (favoriteRecipe) -> Bool in
            return favoriteRecipe.id == recipe.id
        })
        return searchRecipe != nil
    }

    // MARK: - Private

    private func getFavoriteRecipes() -> [FavoriteRecipe] {
        let request : NSFetchRequest<FavoriteRecipe> = FavoriteRecipe.fetchRequest()
        do {
            let favorites = try coreDataStack.viewContext.fetch(request)
            return favorites
        } catch {
            return []
        }
    }
}
