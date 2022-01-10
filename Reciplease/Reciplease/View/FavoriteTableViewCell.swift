
import UIKit
import AlamofireImage

class FavoriteTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var servsAndTimeStackView: UIStackView!
    @IBOutlet weak var servingsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var ingredientDetailsLabel: UILabel!

    // MARK: - Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()

        setAspect()
    }

    // MARK: - Functions

    func configure(with recipe: RecipeDetail) {
        if let imageUrl = recipe.imageUrl {
            recipeImageView.af.setImage(withURL: imageUrl, placeholderImage: UIImage(named: "default pic"))
        } else {
            recipeImageView.image = UIImage(named: "default pic")
        }

        servingsLabel.text = recipe.formatedServings
        timeLabel.text = recipe.formatedTime
        recipeTitleLabel.text = recipe.label
        ingredientDetailsLabel.text = getIngredientsName(from: recipe.ingredients)
    }

    // to obtain preview of ingredients to display in cells, we need to access the food property of each element in the ingredients array :
    private func getIngredientsName(from ingredientsArray: [IngredientDetail]) -> String {
        let ingredientsName = ingredientsArray.map(\.food)
        return ingredientsName.joined(separator: ", ")
    }

    private func setAspect() {
        servsAndTimeStackView.layer.cornerRadius = 5.0
        servsAndTimeStackView.layer.borderWidth = 1
        servsAndTimeStackView.layer.borderColor = UIColor.white.cgColor
    }
}
