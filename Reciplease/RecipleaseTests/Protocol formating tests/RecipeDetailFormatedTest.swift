
import XCTest
@testable import Reciplease

class RecipeDetailFormatedTests: XCTestCase {

    private var correctTestRecipe: RecipeFormated!
    private var incorrectTestRecipe: RecipeFormated!

    override func setUp() {
        super.setUp()
        correctTestRecipe = FakeRecipes.correctRecipeDetail()
        incorrectTestRecipe = FakeRecipes.incorrectRecipeDetail()
    }

    override func tearDown() {
        super.tearDown()
        correctTestRecipe = nil
        incorrectTestRecipe = nil
    }

    // MARK: - Correct Recipe Tests

    func testGivenRecipeHasARawIdentifier_WhenConformingToProtocol_ThenRecipeHasAnID() {
        XCTAssertEqual(correctTestRecipe.id, "b79327d05b8e5b838ad6cfd9576b30b6")
    }

    func testGivenRecipeHasServings_WhenConformingToProtocol_ThenServingsAreFormated() {
        XCTAssertEqual(correctTestRecipe.formatedServings, " 4 🍴")
    }

    func testGivenRecipeHasIngredientLines_WhenConformingToProtocol_ThenIngredientLinesAreFormated() {
        XCTAssertEqual(correctTestRecipe.formatedIngredientLines, "- 1/2 cup olive oil\n- 5 cloves garlic, peeled\n- 2 large russet potatoes, peeled and cut into chunks\n- 1 3-4 pound chicken, cut into 8 pieces (or 3 pound chicken legs)")
    }

    func testGivenRecipeHasATotalTime_WhenConformingToProtocol_ThenTotalTimeIsFormated() {
        XCTAssertEqual(correctTestRecipe.formatedTotalTime, " 60min ⏱")
    }

    func testGivenRecipeHasIngredientsPreview_WhenConformingToProtocol_ThenIngredientsPreviewIsFormated() {
        XCTAssertEqual(correctTestRecipe.formatedIngredientsPreview, "chicken, olive oil, garlic, potatoes")
    }

    // MARK: - Incorrect Recipe Tests

    func testGivenRecipeRawIdentifierIsIncorrect_WhenConformingToProtocol_ThenDefaultStringIsReturned() {
        XCTAssertEqual(incorrectTestRecipe.id, DefaultString.id)
    }

    func testGivenRecipeTitleIsEmpty_WhenConformingToProtocol_ThenDefaultStringIsReturned() {
        XCTAssertEqual(incorrectTestRecipe.recipeName, DefaultString.recipeTitle)
    }
    func testGivenRecipeServingsAreZero_WhenConformingToProtocol_ThenDefaultStringIsReturned() {
        XCTAssertEqual(incorrectTestRecipe.formatedServings, DefaultString.servings)
    }

    func testGivenRecipeTotalTimeIsZero_WhenConformingToProtocol_ThenDefaultStringIsReturned() {
        XCTAssertEqual(incorrectTestRecipe.formatedTotalTime, DefaultString.totalTime)
    }

    func testGivenRecipeHasNoIngredientLines_WhenConformingToProtocol_ThenDefaultStringIsReturned() {
        XCTAssertEqual(incorrectTestRecipe.formatedIngredientLines, DefaultString.ingredientLines)
    }
    func testGivenRecipeHasNoIngredientsPreview_WhenConformingToProtocol_ThenDefaultStringIsReturned() {
        XCTAssertEqual(incorrectTestRecipe.formatedIngredientsPreview, DefaultString.ingredientsPreview)
    }

}
