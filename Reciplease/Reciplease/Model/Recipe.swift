
import Foundation

struct Recipe: RecipeFormated {

    // MARK: - RecipeFormated Protocol Implementation

    var id: String
    var recipeName: String
    var imageUrl: URL?
    var urlToDirections: URL?
    var formatedServings: String
    var formatedIngredientLines: String
    var formatedTotalTime: String
    var formatedIngredientsPreview: String

    // MARK: - Init

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
