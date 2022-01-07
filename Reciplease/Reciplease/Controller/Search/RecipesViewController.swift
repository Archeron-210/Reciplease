
import UIKit

class RecipesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    
    var recipes: [RecipeDetail] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        // Do any additional setup after loading the view.
    }


}

extension RecipesViewController: UITableViewDataSource {
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

        let recipe = recipes[indexPath.row]

        cell.configure(with: recipe)

        return cell
    }
}

extension RecipesViewController: UITableViewDelegate {
    // segue to next controller to display recipe details when a cell is clicked :
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        guard let recipeDetailViewController = self.storyboard?.instantiateViewController(identifier: "RecipeDetailViewController") as? RecipeDetailViewController else {
            return
        }
        recipeDetailViewController.recipeDetail = recipes[indexPath.row]
        self.navigationController?.pushViewController(recipeDetailViewController, animated: true)
    }
}
