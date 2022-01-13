
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
        guard let imageUrl = image else {
            return nil
        }
        return URL(string: imageUrl)
    }

    var recipeUrl: URL? {
        guard let url = stringUrl else {
            return nil
        }
        return URL(string: url)
    }
}
