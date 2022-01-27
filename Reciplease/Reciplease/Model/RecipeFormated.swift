
import Foundation

protocol RecipeFormated {

    var id: String { get }
    var recipeName: String { get }
    var imageUrl: URL? { get }
    var urlToDirections: URL? { get }
    var formatedServings: String { get }
    var formatedIngredientLines: String { get }
    var formatedTotalTime: String { get }
    var formatedIngredientsPreview: String { get }
}

struct Recipe: RecipeFormated {
    var id: String
    var recipeName: String
    var imageUrl: URL?
    var urlToDirections: URL?
    var formatedServings: String
    var formatedIngredientLines: String
    var formatedTotalTime: String
    var formatedIngredientsPreview: String

    init(recipeFormated: RecipeFormated) {
        self.id = recipeFormated.id
        self.recipeName = recipeFormated.recipeName
        self.imageUrl = recipeFormated.imageUrl
        self.urlToDirections = recipeFormated.urlToDirections
        self.formatedServings = recipeFormated.formatedServings
        self.formatedIngredientLines = recipeFormated.formatedIngredientLines
        self.formatedTotalTime = recipeFormated.formatedTotalTime
        self.formatedIngredientsPreview = recipeFormated.formatedIngredientsPreview
    }
}
