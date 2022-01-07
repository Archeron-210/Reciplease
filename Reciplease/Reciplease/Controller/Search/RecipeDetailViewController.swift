
import UIKit

class RecipeDetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var recipePicture: UIImageView!
    @IBOutlet weak var servsAndTimeStackView: UIStackView!
    @IBOutlet weak var servingsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var ingredientListTextView: UITextView!
    @IBOutlet weak var getDirectionsButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!

    var recipeDetail: RecipeDetail?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setInterfaceAspect()
        displayRecipeInfo()
    }

    // MARK: - Actions
    @IBAction func getDirectionsButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
        updateFavoriteIcon()
    }

    // MARK: - Private functions

    private func displayRecipeInfo() {
        guard let recipe = recipeDetail  else {
            return
        }
        servingsLabel.text = recipe.formatedServings
        timeLabel.text = recipe.formatedTime
        recipePicture.image = UIImage(named: "default pic")
        recipeTitleLabel.text = recipe.label
        ingredientListTextView.text = ingredientListFormater(from: recipe.ingredientLines)
    }

    private func ingredientListFormater(from ingredientListArray: [String]) -> String {
        return "- " + ingredientListArray.joined(separator: "\n- ")
    }

    private func updateFavoriteIcon() {
        if !favoriteButton.isHighlighted {
            favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .selected)
        } else {
            favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }


    // MARK: - UI Aspect

    private func setInterfaceAspect() {
        getDirectionsButton.layer.cornerRadius = 10.0
        servsAndTimeStackView.layer.cornerRadius = 5.0
        servsAndTimeStackView.layer.borderWidth = 1
        servsAndTimeStackView.layer.borderColor = UIColor.white.cgColor
    }
}
