
import UIKit

class FavoritesDetailsViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var recipePicture: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var servsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var ingredientListTextView: UITextView!
    @IBOutlet weak var getDirectionButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var servsAndTimeStackView: UIStackView!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setInterfaceAspect()
    }

    // MARK: - Actions
    @IBAction func getDirectionsButtonTapped(_ sender: UIButton) {
    }
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        updateFavoriteIcon()
    }

    // MARK: - Private functions

    private func updateFavoriteIcon() {
        if !favoriteButton.isSelected {
            favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .selected)
        } else {
            favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
    }

    // MARK: - UI Aspect

    private func setInterfaceAspect() {
        getDirectionButton.layer.cornerRadius = 10.0
        servsAndTimeStackView.layer.cornerRadius = 5.0
        servsAndTimeStackView.layer.borderWidth = 0.5
        servsAndTimeStackView.layer.borderColor = UIColor.white.cgColor
    }
}
