//
//  NetworkService.swift
//  Reciplease
//
//  Created by Archeron on 04/01/2022.
//

import Foundation
import Alamofire

class NetworkService {

    static let shared = NetworkService()

    private init() {}

    private let baseURL = "https://api.edamam.com/api/recipes/v2"
    private let appID = "a6638848"
    private let appKey = "26412c033f6bae209ab0f640835652ac"
    private let type = "public"

    func getRecipes(ingredientList: [String], completion: @escaping (Result<[RecipeDetail], AFError>) -> Void) {
        let parameters = computeParameters(for: ingredientList)
        AF.request(baseURL, parameters: parameters).responseDecodable(of: RecipeHit.self) { (response) in
            switch response.result {
            case .success(let recipeHit):
                let recipeDetails = recipeHit.hits.map { $0.recipe } 
                completion(.success(recipeDetails))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func computeParameters(for ingredientList: [String]) -> Parameters {
        let ingredientParam: String = computeIngredientParameter(ingredientList: ingredientList)

        let parameters: Parameters = [
            "q": ingredientParam,
            "app_id": appID,
            "app_key": appKey,
            "type": type
        ]

        return parameters
    }
    func computeIngredientParameter(ingredientList: [String]) -> String {
        return ingredientList.joined(separator: ",")
    }
}



