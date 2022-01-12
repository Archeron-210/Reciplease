
import UIKit
import CoreData

class FavoritesViewController: UIViewController {

    var recipes: [RecipeDetail] {
        FavoriteService.shared.favorites
    }

    private let repository = FavoriteRecipeRepository()

    var favoriteRecipes = [FavoriteRecipe]()

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        favoriteRecipes = repository.getRecipes()
    }

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
        return favoriteRecipes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as? FavoriteTableViewCell else {
            return UITableViewCell()
        }

        let favorite = favoriteRecipes[indexPath.row]

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
        recipeDetailViewController.recipeDetail = recipes[indexPath.row]
        recipeDetailViewController.favoriteRecipeDetail = favoriteRecipes[indexPath.row]
        self.navigationController?.pushViewController(recipeDetailViewController, animated: true)
    }
}


