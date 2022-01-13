
import Foundation
import CoreData

final class FavoriteRecipeRepository {

    static let shared = FavoriteRecipeRepository()

    private let coreDataStack: CoreDataStack

    init(coreDataStack: CoreDataStack = CoreDataStack.shared) {
        self.coreDataStack = coreDataStack
    }

    func getRecipes() -> [FavoriteRecipe] {

        let request : NSFetchRequest<FavoriteRecipe> = FavoriteRecipe.fetchRequest()
        do {
            let favorites = try coreDataStack.viewContext.fetch(request)
            return favorites
        } catch {
            return []
        }

    }

    func saveRecipe(recipe: RecipeDetail) {
        let favoriteRecipe = FavoriteRecipe(context: CoreDataStack.shared.viewContext)
        favoriteRecipe.image = recipe.image
        favoriteRecipe.ingredientLines = ingredientListFormater(from: recipe.ingredientLines)
        favoriteRecipe.ingredientsPreview = getIngredientsName(from: recipe.ingredientsPreview)
        favoriteRecipe.recipeTitle = recipe.recipeTitle
        favoriteRecipe.servings = recipe.servings
        favoriteRecipe.totalTime = recipe.totalTime
        favoriteRecipe.stringUrl = recipe.stringUrl

        do {
            try coreDataStack.viewContext.save()
        } catch {
            print("We were unable to save this recipe to favorites")
        }
    }

    func deleteRecipe(recipe: FavoriteRecipe) {
        coreDataStack.viewContext.delete(recipe)

        do {
            try coreDataStack.viewContext.save()
        } catch {
            print("We were unable to delete this recipe from favorites")
        }
    }

    func isFavorite(recipe: FavoriteRecipe) -> Bool {
        return getRecipes().contains(recipe)
    }

    private func getIngredientsName(from ingredientsArray: [IngredientDetail]) -> String {
        let ingredientsName = ingredientsArray.map(\.food)
        return ingredientsName.joined(separator: ", ")
    }

    private func ingredientListFormater(from ingredientListArray: [String]) -> String {
        return "- " + ingredientListArray.joined(separator: "\n- ")
    }

}
