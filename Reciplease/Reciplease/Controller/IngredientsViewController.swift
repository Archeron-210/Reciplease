
import UIKit

class IngredientsViewController: UIViewController {


    // MARK: - Outlets
    @IBOutlet weak var ingredientTextField: UITextField!
    @IBOutlet weak var ingredientListTextView: UITextView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Properties

    private let recipeService = RecipeService()

    private var ingredientList: [String] = []

    private var ingredientListFormated: String {
        "- " + ingredientList.joined(separator: "\n- ")
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.toggleActivityIndicator(shown: false)
        setButtonsAspect()
        setTextViewAspect()
        setTextFieldAspect()
    }

    // MARK: - Actions
    @IBAction func addButtonTapped(_ sender: UIButton) {
        guard let ingredient = ingredientTextField.text, !ingredient.isEmpty else {
            emptyTextFieldAlert()
            return
        }
        addIngredientToList(ingredient)
        updateIngredientListTextView()
    }

    @IBAction func clearButtonTapped(_ sender: UIButton) {
        clearIngredientList()
    }

    @IBAction func searchButtonTapped(_ sender: Any) {
        guard !ingredientListTextView.text.isEmpty else {
            emptyListAlert()
            return
        }
        getRecipes()
    }

    // MARK: - Private

    private func addIngredientToList(_ ingredient: String) {
        ingredientList.append(ingredient)
    }

    private func updateIngredientListTextView() {
        ingredientListTextView.text = ingredientListFormated
    }

    private func clearIngredientList() {
        ingredientListTextView.text = ""

        ingredientList.removeAll()
    }

    private func getRecipes() {
        toggleActivityIndicator(shown: true)
        recipeService.getRecipes(ingredientList: ingredientList) { result in
            self.toggleActivityIndicator(shown: false)
            switch result {
            case .success(let recipes):
                guard let recipesViewController = self.storyboard?.instantiateViewController(identifier: "RecipesViewController") as? RecipesViewController else {
                    return
                }
                recipesViewController.useRepository = false
                recipesViewController.recipes = recipes
                self.navigationController?.pushViewController(recipesViewController, animated: true)
            case .failure:
                self.errorAlert()
            }
        }
    }

    // MARK: - Alerts

    private func errorAlert() {
        let alert = UIAlertController(title: "⚠️", message: "It seems like something went wrong with servers 🔌", preferredStyle: .alert)
        let actionAlert = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(actionAlert)
        present(alert, animated: true, completion: nil)
    }

    private func emptyTextFieldAlert() {
        let alert = UIAlertController(title: "⚠️", message: "You need to enter an ingredient to make your list! 📝", preferredStyle: .alert)
        let actionAlert = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(actionAlert)
        present(alert, animated: true, completion: nil)
    }

    private func emptyListAlert() {
        let alert = UIAlertController(title: "⚠️", message: "You need to have at least one ingredient in your list to obtain search results 🔍", preferredStyle: .alert)
        let actionAlert = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(actionAlert)
        present(alert, animated: true, completion: nil)
    }

    // MARK: - UI Aspect

    private func setButtonsAspect() {
        addButton.layer.cornerRadius = 10.0
        addButton.layer.borderWidth = 0.5
        addButton.layer.borderColor = UIColor.white.cgColor
        clearButton.layer.cornerRadius = 10.0
        clearButton.layer.borderWidth = 0.5
        clearButton.layer.borderColor = UIColor.white.cgColor
        searchButton.layer.cornerRadius = 10.0
        searchButton.layer.borderWidth = 0.5
        searchButton.layer.borderColor = UIColor.white.cgColor
    }

    private func setTextViewAspect() {
        ingredientListTextView.backgroundColor = UIColor.clear
        ingredientListTextView.layer.cornerRadius = 10
        ingredientListTextView.layer.borderWidth = 0.5
        ingredientListTextView.layer.borderColor = UIColor.white.cgColor
    }

    private func setTextFieldAspect() {
        ingredientTextField.setBottomBorderAndPlaceholderTextColor()
    }

    private func toggleActivityIndicator(shown: Bool) {
        searchButton.isHidden = shown
        activityIndicator.isHidden = !shown
    }
}


// MARK: - Keyboard Management
extension IngredientsViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        ingredientTextField.resignFirstResponder()
        return true
    }

    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        ingredientTextField.resignFirstResponder()
    }
}



