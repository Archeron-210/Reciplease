
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
        setFavoriteIcon()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setFavoriteIcon()
    }

    // MARK: - Actions
    @IBAction func getDirectionsButtonTapped(_ sender: UIButton) {
        goToWebsite()
    }
    
    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
        guard let recipe = recipeDetail  else {
            return
        }
        let isAFavorite = FavoriteService.shared.isFavorite(recipe: recipe)
        if isAFavorite {
            FavoriteService.shared.delete(recipe: recipe)
        } else {
            FavoriteService.shared.add(recipe: recipe)
        }
        setFavoriteIcon() 
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

    private func setFavoriteIcon() {
        guard let recipe = recipeDetail else {
            favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
            return
        }

        let isFavorite = FavoriteService.shared.isFavorite(recipe: recipe)
        let icon = isFavorite ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        favoriteButton.setImage(icon, for: .normal)
    }


    // MARK: - UI Aspect

    private func setInterfaceAspect() {
        getDirectionsButton.layer.cornerRadius = 10.0
        servsAndTimeStackView.layer.cornerRadius = 5.0
        servsAndTimeStackView.layer.borderWidth = 1
        servsAndTimeStackView.layer.borderColor = UIColor.white.cgColor
    }
}
