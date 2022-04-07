
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
    private let aspectSetter = AspectSetting()
    private var ingredientList: [String] = []
    private var ingredientListFormated: String {
        "- " + ingredientList.joined(separator: "\n- ")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        toggleActivityIndicator(shown: false)
        aspectSetter.setButtonAspect(for: addButton)
        aspectSetter.setButtonAspect(for: clearButton)
        aspectSetter.setButtonAspect(for: searchButton)
        aspectSetter.setTextFieldAspect(for: ingredientTextField)
        aspectSetter.setTextViewAspect(for: ingredientListTextView)
    }

    // MARK: - Actions

    @IBAction func addButtonTapped(_ sender: UIButton) {
        guard let ingredient = ingredientTextField.text, !ingredient.isEmpty else {
            alertMessage(title: "⚠︎", message: "You need to enter an ingredient to make your list! 📝")
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
            alertMessage(title: "⚠︎", message: "You need to have at least one ingredient in your list to obtain search results 🔍")
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
                self.goToRecipeViewController(with: recipes)
            case .failure:
                self.alertMessage(title: "⚠︎", message: "It seems like something went wrong with servers 🔌")
            }
        }
    }

    private func goToRecipeViewController(with recipes: [Recipe]) {
        guard let recipesViewController = self.storyboard?.instantiateViewController(identifier: "RecipesViewController") as? RecipesViewController else {
            return
        }
        recipesViewController.useRepository = false
        recipesViewController.recipes = recipes
        self.navigationController?.pushViewController(recipesViewController, animated: true)
    }

    // MARK: - Alert

    private func alertMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionAlert = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(actionAlert)
        present(alert, animated: true, completion: nil)
    }

    // MARK: - UI Aspect

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



