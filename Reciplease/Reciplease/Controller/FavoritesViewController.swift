
import UIKit
import CoreData

class FavoritesViewController: UIViewController {

// MARK: - Outlet

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties

    var recipes: [RecipeFormated] {
        repository.getRecipes()
    }

    private let repository = FavoriteRecipeRepository()

    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
    }
}

extension FavoritesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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

extension FavoritesViewController: UITableViewDelegate {
    // segue to next controller to display recipe details when a cell is clicked :
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        guard let recipeDetailViewController = self.storyboard?.instantiateViewController(identifier: "RecipeDetailViewController") as? RecipeDetailViewController else {
            return
        }
        recipeDetailViewController.recipeFormated = recipes[indexPath.row]
        self.navigationController?.pushViewController(recipeDetailViewController, animated: true)
    }
}


