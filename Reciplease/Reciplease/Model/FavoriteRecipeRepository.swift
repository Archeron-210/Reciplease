
import Foundation
import CoreData

final class FavoriteRecipeRepository {

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
        favoriteRecipe.imageUrl = recipe.image
        favoriteRecipe.ingredientLines = ingredientListFormater(from: recipe.ingredientLines)
        favoriteRecipe.ingredientsPreview = getIngredientsName(from: recipe.ingredients)
        favoriteRecipe.recipeTitle = recipe.label
        favoriteRecipe.servings = recipe.yield
        favoriteRecipe.totalTime = recipe.totalTime
        favoriteRecipe.urlToDirections = recipe.url

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

    private func getIngredientsName(from ingredientsArray: [IngredientDetail]) -> String {
        let ingredientsName = ingredientsArray.map(\.food)
        return ingredientsName.joined(separator: ", ")
    }

    private func ingredientListFormater(from ingredientListArray: [String]) -> String {
        return "- " + ingredientListArray.joined(separator: "\n- ")
    }
    
}
