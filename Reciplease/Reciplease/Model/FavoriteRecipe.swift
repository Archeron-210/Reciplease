
import Foundation
import CoreData

class FavoriteRecipe: NSManagedObject {

    
}

extension FavoriteRecipe: RecipeFormated {

    var imageUrl: URL? {
        guard let imageUrl = image else {
            return nil
        }
        return URL(string: imageUrl)
    }

    var urlToDirections: URL? {
        guard let url = stringUrl else {
            return nil
        }
        return URL(string: url)
    }


    var recipeName: String {
        guard let recipeName = recipeTitle else {
            return "No title"
        }
        return recipeName
    }

    var imageRawUrl: String {
        guard let imageString = image else {
            return "No image url"
        }
        return imageString
    }

    var formatedServings: String {
        guard let servingsString = servings else {
            return "No image url"
        }
        return servingsString
    }

    var rawUrlToDirections: String {
        guard let stringUrlToDirections = stringUrl else {
            return "No directions url"
        }
        return stringUrlToDirections
    }

    var formatedIngredientLines: String {
        guard let stringIngredientLines = ingredientLines else {
            return "No instructions"
        }
        return stringIngredientLines
    }

    var formatedTotalTime: String {
        guard let totalTimeString = totalTime else {
            return "N/A"
        }
        return totalTimeString
    }

    var formatedIngredientsPreview: String {
        guard let stringIngredientsPreview = ingredientsPreview else {
            return "No ingredients preview"
        }
        return stringIngredientsPreview
    }

    
}
