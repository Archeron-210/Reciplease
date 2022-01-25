
import Foundation
import CoreData


class FavoriteRecipe: NSManagedObject {}


extension FavoriteRecipe: RecipeFormated {

    var id: String {
        guard let idFormated = rawIdentifer else {
            return DefaultString.id
        }
        return idFormated
    }

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
            return DefaultString.recipeTitle
        }
        return recipeName
    }

    var imageRawUrl: String {
        guard let imageString = image else {
            return DefaultString.rawImageUrl
        }
        return imageString
    }

    var formatedServings: String {
        guard let servingsString = servings else {
            return DefaultString.servings
        }
        return servingsString
    }

    var rawUrlToDirections: String {
        guard let stringUrlToDirections = stringUrl else {
            return DefaultString.rawUrlToDirections
        }
        return stringUrlToDirections
    }

    var formatedIngredientLines: String {
        guard let stringIngredientLines = ingredientLines else {
            return DefaultString.ingredientLines
        }
        return stringIngredientLines
    }

    var formatedTotalTime: String {
        guard let totalTimeString = totalTime else {
            return DefaultString.totalTime
        }
        return totalTimeString
    }

    var formatedIngredientsPreview: String {
        guard let stringIngredientsPreview = ingredientsPreview else {
            return DefaultString.ingredientsPreview
        }
        return stringIngredientsPreview
    }

    
}
