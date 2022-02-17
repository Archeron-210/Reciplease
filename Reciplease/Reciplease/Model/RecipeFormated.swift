
import Foundation

// This protocol allows to uniformize the use of objects throughout the app
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


