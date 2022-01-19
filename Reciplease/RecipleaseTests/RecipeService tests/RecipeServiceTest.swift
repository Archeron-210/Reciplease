

import XCTest
@testable import Reciplease

class RecipeServiceTest: XCTestCase {

    // The only test here is to check if we correctly obtain a [RecipeDetail] when network call is successful 

    let testIngredientsList = ["chicken"]

    func testGetRecipesShouldCompleteSuccessfullyWithRecipesIfNoError() {
        let recipeService = RecipeService(networkService: FakeNetworkService(), configuration: FakeConfiguration.recipesCorrect)

        recipeService.getRecipes(ingredientList: testIngredientsList) { (result: Result<[RecipeDetail], Error>) in
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
}
