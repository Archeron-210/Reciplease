
import Foundation
import CoreData

final class FavoriteRecipeRepository {

    static let shared = FavoriteRecipeRepository()

    private let coreDataStack: CoreDataStack

    init(coreDataStack: CoreDataStack = CoreDataStack.shared) {
        self.coreDataStack = coreDataStack
    }

    func getRecipes() -> [RecipeFormated] {
        return getFavoriteRecipes()
    }

    func saveRecipe(recipe: RecipeFormated) {
        let favoriteRecipe = FavoriteRecipe(context: CoreDataStack.shared.viewContext)
        favoriteRecipe.image = recipe.imageUrl?.absoluteString
        favoriteRecipe.ingredientLines = recipe.formatedIngredientLines
        favoriteRecipe.ingredientsPreview = recipe.formatedIngredientsPreview
        favoriteRecipe.recipeTitle = recipe.recipeName
        favoriteRecipe.servings = recipe.formatedServings
        favoriteRecipe.totalTime = recipe.formatedTotalTime
        favoriteRecipe.stringUrl = recipe.urlToDirections?.absoluteString
        do {
            try coreDataStack.viewContext.save()
        } catch {
            print("We were unable to save this recipe to favorites")
        }
    }

    func deleteRecipe(recipe: RecipeFormated) {
        let searchRecipe = getFavoriteRecipes().first(where: { (favoriteRecipe) -> Bool in
            return favoriteRecipe.recipeName == recipe.recipeName
        })
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
            return favoriteRecipe.recipeName == recipe.recipeName
        })
        return searchRecipe != nil
    }

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
