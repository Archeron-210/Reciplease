
import Foundation
import CoreData

class FavoriteRecipe: NSManagedObject {

    var formatedTime: String {
        " \(Int(self.totalTime))min ⏱"
    }

    var formatedServings: String {
        "\(Int(self.servings)) 🍴"
    }

    var formatedImageUrl: URL? {
        guard let image = imageUrl else {
            return nil
        }
        return URL(string: image)
    }

    var recipeUrl: URL? {
        guard let url = urlToDirections else {
            return nil
        }
        return URL(string: url)
    }
}
