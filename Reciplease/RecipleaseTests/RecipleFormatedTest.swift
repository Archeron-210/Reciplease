
import XCTest
@testable import Reciplease

class RecipeFormatedTests: XCTestCase {

    // We test in this class if everything is correctly formated in our model

    let testRecipe = FakeRecipes.correctRecipeDetail()

    func testGivenRecipeHasARawIdentifier_WhenConformingToProtocol_ThenRecipeHasAnID() {
        XCTAssertEqual(testRecipe.id, "b79327d05b8e5b838ad6cfd9576b30b6")
    }

    func testGivenRecipeHasServings_WhenConformingToProtocol_ThenServingsAreFormated() {
        XCTAssertEqual(testRecipe.formatedServings, " 4 🍴")
    }

    func testGivenRecipeHasIngredientLines_WhenConformingToProtocol_ThenIngredientLinesAreFormated() {
        XCTAssertEqual(testRecipe.formatedIngredientLines, "- 1/2 cup olive oil\n- 5 cloves garlic, peeled\n- 2 large russet potatoes, peeled and cut into chunks\n- 1 3-4 pound chicken, cut into 8 pieces (or 3 pound chicken legs)")
    }

    func testGivenRecipeHasATotalTime_WhenConformingToProtocol_ThenTotalTimeIsFormated() {
        XCTAssertEqual(testRecipe.formatedTotalTime, " 60min ⏱")
    }

    func testGivenRecipeHasIngredientsPreview_WhenConformingToProtocol_ThenIngredientsPreviewIsFormated() {
        XCTAssertEqual(testRecipe.formatedIngredientsPreview, "chicken, olive oil, garlic, potatoes")
    }
  
}
