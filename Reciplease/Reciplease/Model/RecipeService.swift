
import Foundation

class RecipeService {

    // MARK: - Singleton

    static let shared = RecipeService()

    // MARK: - Properties

    private let networkService: NetworkProtocol

    // MARK: - Init

    init(networkService: NetworkProtocol = NetworkService()) {
        self.networkService = networkService
    }

    // MARK: - Properties

    private let baseURL = "https://api.edamam.com/api/recipes/v2"
    private let appID = "a6638848"
    private let appKey = "26412c033f6bae209ab0f640835652ac"
    private let type = "public"

    // MARK: - Functions

    func getRecipes(ingredientList: [String], completion: @escaping (Result<[RecipeDetail], Error>) -> Void) {
        let parameters = computeParameters(for: ingredientList)

        networkService.request(baseURL: baseURL, parameters: parameters) { (result: Result<RecipeHit, Error>) in
            switch result {
            case .success(let recipeHit):
                // create a copy in which we can access directly the recipe details :
                let recipeDetails = recipeHit.hits.map(\.recipe)
                completion(.success(recipeDetails))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    // MARK: - Private

    private func computeParameters(for ingredientList: [String]) -> [String: Any] {
        let ingredientParameter = computeIngredientParameter(ingredientList: ingredientList)

        let parameters: [String: Any] = [
            "q": ingredientParameter,
            "app_id": appID,
            "app_key": appKey,
            "type": type
        ]

        return parameters
    }


    private func computeIngredientParameter(ingredientList: [String]) -> String {
        return ingredientList.joined(separator: ",")
    }
}



