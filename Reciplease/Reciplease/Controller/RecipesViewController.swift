
import UIKit
import CoreData

class RecipesViewController: UIViewController {

// MARK: - Outlet

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties

    var recipes: [RecipeFormated] = []
    // property that determines if we should display favorites or search results by stating if we use the repository or not :
    var useRepository: Bool = true
    private let repository = FavoriteRecipeRepository()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if useRepository {
            // pass correct data to recipes in case we display favorites :
            recipes = repository.getRecipes()
            tableView.reloadData()
        }
    }
}

    // MARK: - TableView Management

extension RecipesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if recipes.count == 0 {
            if useRepository {
                self.tableView.setEmptyMessage("You do not have any favorite yet!\n🥘")
            } else {
                self.tableView.setEmptyMessage("Sorry, we were unable to find matching results \nfor your search, please try again after checking your spelling !\n🥘")
            }
        } else {
            self.tableView.restore()
        }
        return recipes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as? RecipeTableViewCell else {
            return UITableViewCell()
        }

        let favorite = recipes[indexPath.row]

        cell.configure(with: favorite)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        160.0
    }
}

    // MARK: - Navigation

extension RecipesViewController: UITableViewDelegate {
    // segue to next controller to display recipe details when a cell is clicked :
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        goToRecipeDetailViewController(with: recipes[indexPath.row])
    }

    private func goToRecipeDetailViewController(with recipe: RecipeFormated) {
        guard let recipeDetailViewController = self.storyboard?.instantiateViewController(identifier: "RecipeDetailViewController") as? RecipeDetailViewController else {
            return
        }
        recipeDetailViewController.recipeFormated = recipe
        self.navigationController?.pushViewController(recipeDetailViewController, animated: true)
    }

}


