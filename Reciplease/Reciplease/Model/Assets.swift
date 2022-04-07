
import Foundation
import UIKit

enum Assets: String {
    
    case star = "star"
    case starFill = "star.fill"
    case defaultPic = "default pic"

    var image: UIImage? {
        return UIImage(named: self.rawValue)
    }

    var systemIcon: UIImage? {
        return UIImage(systemName: self.rawValue)
    }
}
