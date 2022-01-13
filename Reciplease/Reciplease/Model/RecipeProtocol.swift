

import Foundation

protocol RecipeFormated {
    var recipeName: String {get}
    var imageUrl: URL? {get}
    var urlToDirections: URL? {get}
    var formatedServings: String {get}
    var formatedIngredientLines: String {get}
    var formatedTotalTime: String {get}
    var formatedIngredientsPreview: String {get}
}
