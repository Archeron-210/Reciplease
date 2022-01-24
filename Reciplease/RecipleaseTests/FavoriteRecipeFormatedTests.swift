//
//  FavoriteRecipeFormatedTests.swift
//  RecipleaseTests
//
//  Created by Archeron on 20/01/2022.
//
import XCTest
@testable import Reciplease
import CoreData

class FavoriteRecipeFormatedTests: XCTestCase {

        var favoriteRecipe: FavoriteRecipe!

        override func setUp() {
            super.setUp()
            let coreDataStack = CoreDataTestStack()
            let repository = FavoriteRecipeRepository(coreDataStack: coreDataStack)
            favoriteRecipe = FakeFavoriteRecipe.correctFavoriteRecipe(coreDataStack: coreDataStack, repository: repository)
        }

        override func tearDown() {
            super.tearDown()
            favoriteRecipe = nil
        }

    func testGivenFavoriteRecipeAsARawIdentifier_WhenConformingToProtocol_ThenItHasAnId() {
        XCTAssertEqual(favoriteRecipe.id, "b79327d05b8e5b838ad6cfd9576b30b6")
        }

    func testGivenFavoriteRecipeHasATitle_WhenConformingToProtocol_ThenItHasARecipeName() {
        XCTAssertEqual(favoriteRecipe.recipeName, "Chicken Vesuvio")
    }

    func testGivenFavoriteRecipeHasAStringUrlForItsImage_WhenConfomingToProtocol_ThenItHasAnImageRawUrl() {
        XCTAssertEqual(favoriteRecipe.imageRawUrl, "https://www.edamam.com/web-img/e42/e42f9119813e890af34c259785ae1cfb.jpg")
    }

    func testGivenFavoriteRecipeHasAStringUrlForItsImage_WhenConformingToProtocol_ThenItHasAnUrlForItsImage() {
        XCTAssertNotNil(favoriteRecipe.imageUrl)
    }

    func testGivenFavoriteRecipeHasAStringUrlToDirections_WhenConformingToProtocol_ThenItHasARawUrlToDirections() {
        XCTAssertEqual(favoriteRecipe.rawUrlToDirections, "http://www.seriouseats.com/recipes/2011/12/chicken-vesuvio-recipe.html")
    }

    func testGivenFavoriteRecipeHasAStringUrlToDirections_WhenConformingToProtocol_ThenItHasAnUrlToDirections() {
        XCTAssertNotNil(favoriteRecipe.urlToDirections)
    }

    func testGivenFavoriteRecipeHasServings_WhenConformingToProtocol_ThenServingsAreFormated() {
        XCTAssertEqual(favoriteRecipe.formatedServings, " 4 🍴")
        }

    func testGivenFavoriteRecipeHasIngredientLines_WhenConformingToProtocol_ThenIngrdientLinesAreFormated() {
        XCTAssertEqual(favoriteRecipe.formatedIngredientLines, "- 1/2 cup olive oil\n- 5 cloves garlic, peeled\n- 2 large russet potatoes, peeled and cut into chunks\n- 1 3-4 pound chicken, cut into 8 pieces (or 3 pound chicken legs)")
    }

    func testGivenFavoriteRecipeHasTotalTime_WhenConformingToProtocol_ThenTotalTimeIsFormated() {
        XCTAssertEqual(favoriteRecipe.formatedTotalTime, " 60min ⏱")
    }

    func testGivenFavoriteRecipeHasIngredientsPreview_WhenConformingToProtocol_ThenIngredientsPreviewIsFormated() {
        XCTAssertEqual(favoriteRecipe.formatedIngredientsPreview, "chicken, olive oil, garlic, potatoes")
    }
    

}
