
import UIKit
import CoreData

class FavoritesViewController: UIViewController {

// MARK: - Outlet

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Properties

    var recipes: [FavoriteRecipe] {
        repository.getRecipes()
    }

    private let repository = FavoriteRecipeRepository()

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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as? FavoriteTableViewCell else {
            return UITableViewCell()
        }

        let favorite = recipes[indexPath.row]

        cell.configure(with: favorite)

        return cell
    }

}

extension FavoritesViewController: UITableViewDelegate {
    // segue to next controller to display recipe details when a cell is clicked :
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        guard let recipeDetailViewController = self.storyboard?.instantiateViewController(identifier: "RecipeDetailViewController") as? RecipeDetailViewController else {
            return
        }
        recipeDetailViewController.favoriteRecipeDetail = recipes[indexPath.row]
        self.navigationController?.pushViewController(recipeDetailViewController, animated: true)
    }
}


