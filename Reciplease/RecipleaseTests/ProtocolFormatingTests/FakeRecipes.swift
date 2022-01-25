
import Foundation
@testable import Reciplease
import CoreData

class FakeRecipes {

    static func correctRecipeDetail() -> RecipeFormated {
        return RecipeDetail(
            rawIdentifier: "http://www.edamam.com/ontologies/edamam.owl#recipe_b79327d05b8e5b838ad6cfd9576b30b6",
            recipeTitle: "Chicken Vesuvio",
            image: "https://www.edamam.com/web-img/e42/e42f9119813e890af34c259785ae1cfb.jpg",
            stringUrl: "http://www.seriouseats.com/recipes/2011/12/chicken-vesuvio-recipe.html",
            servings: 4.0,
            ingredientLines: [
                "1/2 cup olive oil",
                "5 cloves garlic, peeled",
                "2 large russet potatoes, peeled and cut into chunks",
                "1 3-4 pound chicken, cut into 8 pieces (or 3 pound chicken legs)"],

            totalTime: 60.0,
            ingredientsPreview: [IngredientDetail(food: "chicken"), IngredientDetail(food: "olive oil"), IngredientDetail(food: "garlic"), IngredientDetail(food: "potatoes")]
        )
    }

    static func incorrectRecipeDetail() -> RecipeFormated {
        return RecipeDetail(
            rawIdentifier: "",
            recipeTitle: "",
            image: "",
            stringUrl: "",
            servings: 0,
            ingredientLines: [],
            totalTime: 0,
            ingredientsPreview: []
        )
    }
}



class FakeFavoriteRecipe {

    static func correctFavoriteRecipe(coreDataStack: CoreDataStackProtocol, repository: FavoriteRecipeRepository) -> FavoriteRecipe {

        let recipe = FakeRecipes.correctRecipeDetail()
        let favoriteRecipe = FavoriteRecipe(context: coreDataStack.viewContext)
        favoriteRecipe.image = recipe.imageUrl?.absoluteString
        favoriteRecipe.ingredientLines = recipe.formatedIngredientLines
        favoriteRecipe.ingredientsPreview = recipe.formatedIngredientsPreview
        favoriteRecipe.recipeTitle = recipe.recipeName
        favoriteRecipe.servings = recipe.formatedServings
        favoriteRecipe.totalTime = recipe.formatedTotalTime
        favoriteRecipe.stringUrl = recipe.urlToDirections?.absoluteString
        favoriteRecipe.rawIdentifer = recipe.id

        repository.saveRecipe(recipe: favoriteRecipe)

        return favoriteRecipe
    }

    static func incorrectFavoriteRecipe(coreDataStack: CoreDataStackProtocol, repository: FavoriteRecipeRepository) -> FavoriteRecipe {

        let recipe = FakeRecipes.incorrectRecipeDetail()
        let wrongFavoriteRecipe = FavoriteRecipe(context: coreDataStack.viewContext)
        wrongFavoriteRecipe.image = recipe.imageUrl?.absoluteString
        wrongFavoriteRecipe.ingredientLines = recipe.formatedIngredientLines
        wrongFavoriteRecipe.ingredientsPreview = recipe.formatedIngredientsPreview
        wrongFavoriteRecipe.recipeTitle = recipe.recipeName
        wrongFavoriteRecipe.servings = recipe.formatedServings
        wrongFavoriteRecipe.totalTime = recipe.formatedTotalTime
        wrongFavoriteRecipe.stringUrl = recipe.urlToDirections?.absoluteString
        wrongFavoriteRecipe.rawIdentifer = recipe.id

        repository.saveRecipe(recipe: wrongFavoriteRecipe)

        return wrongFavoriteRecipe
    }


}
