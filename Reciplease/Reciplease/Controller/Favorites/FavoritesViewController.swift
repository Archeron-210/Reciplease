
import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var favorites: [RecipeDetail] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.reloadData()
    }
    


}

extension FavoritesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath) as? FavoriteTableViewCell else {
            return UITableViewCell()
        }

        let favorite = favorites[indexPath.row]

        cell.configure(with: favorite)

        return cell
    }

}

extension FavoritesViewController: UITableViewDelegate {
    // segue to next controller to display favorite details when a cell is clicked :
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        guard let favoriteDetailViewController = self.storyboard?.instantiateViewController(identifier: "FavoriteDetailViewController") as? FavoritesDetailsViewController else {
            return
        }
        favoriteDetailViewController.favoriteDetail = favorites[indexPath.row]
        self.navigationController?.pushViewController(favoriteDetailViewController, animated: true)
    }
}


