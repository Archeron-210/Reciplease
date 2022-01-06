
import UIKit

class RecipeDetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var recipePicture: UIImageView!
    @IBOutlet weak var servsAndTimeStackView: UIStackView!
    @IBOutlet weak var servsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var ingredientListTextView: UITextView!
    @IBOutlet weak var getDirectionsButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!


    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setInterfaceAspect()
    }

    // MARK: - Actions
    @IBAction func getDirectionsButtonTapped(_ sender: UIButton) {
    }
    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
        updateFavoriteIcon()
    }

    // MARK: - Private functions

    private func updateServsAndTimeLabels() {

    }

    private func updateRecipePicture() {

    }

    private func updateRecipeTitleLable() {

    }

    private func updateIngredientList() {

    }

    private func updateFavoriteIcon() {
        if !favoriteButton.isSelected {
            favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .selected)
        } else {
            favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        }

    }


    // MARK: - UI Aspect

    private func setInterfaceAspect() {
        getDirectionsButton.layer.cornerRadius = 10.0
        servsAndTimeStackView.layer.cornerRadius = 5.0
        servsAndTimeStackView.layer.borderWidth = 0.5
        servsAndTimeStackView.layer.borderColor = UIColor.white.cgColor
    }
}
