
import XCTest
@testable import Reciplease
import CoreData

class FavoriteRecipeFormatedTests: XCTestCase {

    var correctFavoriteRecipe: FavoriteRecipe!
    var incorrectFavoriteRecipe: FavoriteRecipe!

        override func setUp() {
            super.setUp()
            let coreDataStack = CoreDataTestStack()
            let repository = FavoriteRecipeRepository(coreDataStack: coreDataStack)
            correctFavoriteRecipe = FakeFavoriteRecipe.correctFavoriteRecipe(coreDataStack: coreDataStack, repository: repository)
            incorrectFavoriteRecipe = FakeFavoriteRecipe.incorrectFavoriteRecipe(coreDataStack: coreDataStack, repository: repository)
        }

        override func tearDown() {
            super.tearDown()
            correctFavoriteRecipe = nil
            incorrectFavoriteRecipe  = nil
        }

    // MARK: - Correct Favorite Recipe

    func testGivenFavoriteRecipeAsARawIdentifier_WhenConformingToProtocol_ThenItHasAnId() {
        XCTAssertEqual(correctFavoriteRecipe.id, "b79327d05b8e5b838ad6cfd9576b30b6")
        }

    func testGivenFavoriteRecipeHasATitle_WhenConformingToProtocol_ThenItHasARecipeName() {
        XCTAssertEqual(correctFavoriteRecipe.recipeName, "Chicken Vesuvio")
    }

    func testGivenFavoriteRecipeHasAStringUrlForItsImage_WhenConfomingToProtocol_ThenItHasAnImageRawUrl() {
        XCTAssertEqual(correctFavoriteRecipe.imageRawUrl, "https://www.edamam.com/web-img/e42/e42f9119813e890af34c259785ae1cfb.jpg")
    }

    func testGivenFavoriteRecipeHasAStringUrlForItsImage_WhenConformingToProtocol_ThenItHasAnUrlForItsImage() {
        XCTAssertNotNil(correctFavoriteRecipe.imageUrl)
    }

    func testGivenFavoriteRecipeHasAStringUrlToDirections_WhenConformingToProtocol_ThenItHasARawUrlToDirections() {
        XCTAssertEqual(correctFavoriteRecipe.rawUrlToDirections, "http://www.seriouseats.com/recipes/2011/12/chicken-vesuvio-recipe.html")
    }

    func testGivenFavoriteRecipeHasAStringUrlToDirections_WhenConformingToProtocol_ThenItHasAnUrlToDirections() {
        XCTAssertNotNil(correctFavoriteRecipe.urlToDirections)
    }

    func testGivenFavoriteRecipeHasServings_WhenConformingToProtocol_ThenServingsAreFormated() {
        XCTAssertEqual(correctFavoriteRecipe.formatedServings, " 4 🍴")
        }

    func testGivenFavoriteRecipeHasIngredientLines_WhenConformingToProtocol_ThenIngrdientLinesAreFormated() {
        XCTAssertEqual(correctFavoriteRecipe.formatedIngredientLines, "- 1/2 cup olive oil\n- 5 cloves garlic, peeled\n- 2 large russet potatoes, peeled and cut into chunks\n- 1 3-4 pound chicken, cut into 8 pieces (or 3 pound chicken legs)")
    }

    func testGivenFavoriteRecipeHasTotalTime_WhenConformingToProtocol_ThenTotalTimeIsFormated() {
        XCTAssertEqual(correctFavoriteRecipe.formatedTotalTime, " 60min ⏱")
    }

    func testGivenFavoriteRecipeHasIngredientsPreview_WhenConformingToProtocol_ThenIngredientsPreviewIsFormated() {
        XCTAssertEqual(correctFavoriteRecipe.formatedIngredientsPreview, "chicken, olive oil, garlic, potatoes")
    }

    // MARK: - Incorrect Favorite Recipe

    func testGivenFavoriteRecipeHasIncorrectRawIdentifier_WhenConformingToProtocol_ThenDefaultStringIsReturned() {
        XCTAssertEqual(incorrectFavoriteRecipe.id, DefaultString.id)
    }

    func testGivenFavoriteRecipeHasNoTitle_WhenConformingToProtocol_ThenDefaultStringIsReturned() {
        XCTAssertEqual(incorrectFavoriteRecipe.recipeName, DefaultString.recipeTitle)
    }

    func testGivenFavoriteRecipeHasNoStringUrlForItsImage_WhenConformingToProtocol_ThenDefaultStringIsReturnedAndNoUrl() {
        XCTAssertEqual(incorrectFavoriteRecipe.imageRawUrl, DefaultString.rawImageUrl)
        XCTAssertNil(incorrectFavoriteRecipe.imageUrl)
    }

    func testGivenFavoriteRecipeHasNoStringUrlForDirections_WhenConformingToProtocol_ThenDefaultStringIsReturnedAndNoUrl() {
        XCTAssertEqual(incorrectFavoriteRecipe.rawUrlToDirections, DefaultString.rawUrlToDirections)
        XCTAssertNil(incorrectFavoriteRecipe.urlToDirections)
    }

    func testGivenFavoriteRecipeServingsAreZero_WhenConformingToProtocol_ThenDefaultStringIsReturned() {
        XCTAssertEqual(incorrectFavoriteRecipe.formatedServings, DefaultString.servings)
    }

    func testGivenFavoriteRecipeTotalTimeIsZero_WhenConformingToProtocol_ThenDefaultStringIsReturned() {
        XCTAssertEqual(incorrectFavoriteRecipe.formatedTotalTime, DefaultString.totalTime)
    }

    func testGivenFavoriteRecipeHasNoIngredientLines_WhenConformingToProtocol_ThenDefaultStringIsReturned() {
        XCTAssertEqual(incorrectFavoriteRecipe.ingredientLines, DefaultString.ingredientLines)
    }

    func testGivenFavoriteRecipeHasNoIngredientsPreview_WhenConformingToProtocol_ThenDefaultStringIsReturned() {
        XCTAssertEqual(incorrectFavoriteRecipe.ingredientsPreview, DefaultString.ingredientsPreview)
    }

}
