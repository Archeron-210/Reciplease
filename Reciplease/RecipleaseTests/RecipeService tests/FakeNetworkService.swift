
import Foundation
@testable import Reciplease

class FakeNetworkService: NetworkProtocol {
    func request<T: Decodable>(baseURL: String, parameters: [String : Any], completion: @escaping (Result<T, NetworkError>) -> Void) {
        let bundle = Bundle(for: FakeNetworkService.self)
        let url = bundle.url(forResource: baseURL, withExtension: "json")!
        let jsonData = try! Data(contentsOf: url)
        let decodedData: T = try! JSONDecoder().decode(T.self, from: jsonData)
        completion(.success(decodedData))
    }
}

class FakeConfiguration {
    static var recipesCorrect: APIConfiguration {
        APIConfiguration(baseURL: "Reciplease", appID: "", appKey: "", type: "")
    }

    static var recipesEmpty: APIConfiguration {
        APIConfiguration(baseURL: "RecipesEmpty", appID: "", appKey: "", type: "")
    }
}
