

import XCTest
@testable import Reciplease

class RecipeServiceTest: XCTestCase {

    // The only test here is to check if we correctly obtain a [Recipe] when network call is successful

    private let testIngredientsList = ["chicken"]

    func testGetRecipesShouldCompleteSuccessfullyWithRecipesIfNoError() {
        let recipeService = RecipeService(networkService: FakeNetworkService(), configuration: FakeConfiguration.recipesCorrect)

        recipeService.getRecipes(ingredientList: testIngredientsList) { (result: Result<[Recipe], Error>) in
            // Then
            switch result {
            case .failure:
                XCTFail("Request should not fail")
            case .success(let result):
                XCTAssertNotNil(result)
                XCTAssertEqual(result.count, 20)
            }
        }
    }

    func testGetRecipesShouldFailWithErrorIfIncorrectData() {
        let recipeService = RecipeService(networkService: FakeNetworkService(), configuration: FakeConfiguration.recipesIncorrect)

        recipeService.getRecipes(ingredientList: testIngredientsList) { (result: Result<[Recipe], Error>) in
            // Then
            switch result {
            case .failure(let error):
                XCTAssertNotNil(error)
            case .success:
                XCTFail("Request should not succeed")
            }
        }
    }
}
