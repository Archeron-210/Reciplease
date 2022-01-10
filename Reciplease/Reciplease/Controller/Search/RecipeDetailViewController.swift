
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
        updateFavoriteIcon()
    }

    // MARK: - Actions
    @IBAction func getDirectionsButtonTapped(_ sender: UIButton) {
        goToWebsite()
    }
    
    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
        guard let recipe = recipeDetail  else {
            return
        }
        FavoriteService.shared.add(recipe: recipe)
        favoriteButton.isSelected.toggle()
    }

    // MARK: - Private functions

    private func displayRecipeInfo() {
        guard let recipe = recipeDetail  else {
            return
        }
        if let imageUrl = recipe.imageUrl {
            recipePicture.af.setImage(withURL: imageUrl, placeholderImage: UIImage(named: "default pic"))
        } else {
            recipePicture.image = UIImage(named: "default pic")
        }
        servingsLabel.text = recipe.formatedServings
        timeLabel.text = recipe.formatedTime
        recipeTitleLabel.text = recipe.label
        ingredientListTextView.text = ingredientListFormater(from: recipe.ingredientLines)
    }

    private func goToWebsite() {
        guard let recipeUrl = recipeDetail?.recipeUrl else {
            return
        }
        UIApplication.shared.open(recipeUrl)
    }

    private func ingredientListFormater(from ingredientListArray: [String]) -> String {
        return "- " + ingredientListArray.joined(separator: "\n- ")
    }

    private func updateFavoriteIcon() {
        let icon = UIImage(systemName: "star")
        let iconFilled = UIImage(systemName: "star.fill")
        favoriteButton.setImage(icon, for: .normal)
            favoriteButton.setImage(iconFilled, for: .selected)
    }


    // MARK: - UI Aspect

    private func setInterfaceAspect() {
        getDirectionsButton.layer.cornerRadius = 10.0
        servsAndTimeStackView.layer.cornerRadius = 5.0
        servsAndTimeStackView.layer.borderWidth = 1
        servsAndTimeStackView.layer.borderColor = UIColor.white.cgColor
    }
}
