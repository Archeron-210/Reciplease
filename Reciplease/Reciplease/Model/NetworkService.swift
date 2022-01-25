
import Foundation
import Alamofire

protocol NetworkProtocol: AnyObject {
    func request<T: Decodable>(baseURL: String, parameters: [String: Any], completion: @escaping (Result<T, Error>) -> Void)
}

class NetworkService: NetworkProtocol {
    func request<T: Decodable>(baseURL: String, parameters: [String : Any], completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(baseURL, parameters: parameters).responseDecodable(of: T.self) { (response) in
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

