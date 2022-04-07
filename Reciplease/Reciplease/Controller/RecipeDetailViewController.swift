
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

    // MARK: - Properties

    private let repository = FavoriteRecipeRepository()
    private let aspectSetter = AspectSetting()
    var recipeFormated: RecipeFormated?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        aspectSetter.setButtonAspect(for: getDirectionsButton)
        aspectSetter.setStackViewAspect(for: servsAndTimeStackView)
        aspectSetter.setTextViewAspect(for: ingredientListTextView)
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
        manageFavorite()
    }

    // MARK: - Private

    private func displayRecipeInfo() {
        guard let recipe = recipeFormated  else {
            return
        }
        if let imageUrl = recipe.imageUrl {
            recipePicture.af.setImage(withURL: imageUrl, placeholderImage: Assets.defaultPic.image)
        } else {
            recipePicture.image = Assets.defaultPic.image
        }
        servingsLabel.text = recipe.formatedServings
        timeLabel.text = recipe.formatedTotalTime
        recipeTitleLabel.text = recipe.recipeName
        ingredientListTextView.text = recipe.formatedIngredientLines
    }

    private func manageFavorite() {
        guard let recipe = recipeFormated else {
            return
        }

        let isAFavorite = repository.isFavorite(recipe: recipe)
        if isAFavorite {
          repository.deleteRecipe(recipe: recipe)
        } else {
            repository.saveRecipe(recipe: recipe)
        }
        setFavoriteIcon()
    }

    private func goToWebsite() {
        guard let recipeUrl = recipeFormated?.urlToDirections else {
            urlErrorAlert()
            return
        }
        UIApplication.shared.open(recipeUrl)
    }

    // MARK: - Alert

    private func urlErrorAlert() {
        let alert = UIAlertController(title: "⚠︎", message: "Sorry, it seems like this recipe URL is broken 🔌", preferredStyle: .alert)
        let actionAlert = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(actionAlert)
        present(alert, animated: true, completion: nil)
    }

    // MARK: - UI Aspect

    private func setFavoriteIcon() {
        guard let recipe = recipeFormated else {
            favoriteButton.setImage(Assets.star.systemIcon, for: .normal)
            return
        }

        let isFavorite = repository.isFavorite(recipe: recipe)
        let icon = isFavorite ? Assets.starFill.systemIcon : Assets.star.systemIcon
        favoriteButton.setImage(icon, for: .normal)
    }
}
