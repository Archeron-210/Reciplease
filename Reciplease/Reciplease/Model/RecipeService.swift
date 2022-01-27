
import Foundation

struct APIConfiguration {
    let baseURL: String
    let appID: String
    let appKey: String
    let type: String

    init(baseURL: String, appID: String, appKey: String, type: String) {
        self.baseURL = baseURL
        self.appID = appID
        self.appKey = appKey
        self.type = type
    }

    init() {
        self.baseURL = "https://api.edamam.com/api/recipes/v2"
        self.appID = "a6638848"
        self.appKey = "26412c033f6bae209ab0f640835652ac"
        self.type = "public"
    }
}

class RecipeService {

    // MARK: - Properties

    private let networkService: NetworkProtocol
    private let apiConfiguration: APIConfiguration

    // MARK: - Init

    init(networkService: NetworkProtocol = NetworkService(), configuration: APIConfiguration = APIConfiguration()) {
        self.networkService = networkService
        self.apiConfiguration = configuration
    }

    // MARK: - Functions

    func getRecipes(ingredientList: [String], completion: @escaping (Result<[RecipeDetail], Error>) -> Void) {
        let parameters = computeParameters(for: ingredientList)

        networkService.request(baseURL: apiConfiguration.baseURL, parameters: parameters) { (result: Result<RecipeHit, Error>) in
            switch result {
            case .success(let recipeHit):
                // creating a copy in which we can access directly the recipe details :
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
            "app_id": apiConfiguration.appID,
            "app_key": apiConfiguration.appKey,
            "type": apiConfiguration.type
        ]

        return parameters
    }


    private func computeIngredientParameter(ingredientList: [String]) -> String {
        return ingredientList.joined(separator: ",")
    }
}



