
import XCTest
@testable import Reciplease
import CoreData

class FavoriteRecipeRepositoryTests: XCTestCase {

    var coreDataStack: CoreDataStack!
    var repository: FavoriteRecipeRepository!

    override func setUp() {
        super.setUp()
        coreDataStack = CoreDataTestStack()
        repository = FavoriteRecipeRepository()
    }

    override func tearDown() {
        super.tearDown()
        coreDataStack = nil
        repository = nil
    }

    func testGivenARecipeIsValid_WhenSavingToFavorites_ThenTheRecipeIsCorrectlySaved() {

        let validRecipe = FakeRecipes.correctRecipeDetail()

        repository.saveRecipe(recipe: validRecipe)

        let favoriteRecipes = repository.getRecipes()

        XCTAssertNotNil(favoriteRecipes)
        XCTAssertTrue(favoriteRecipes.count == 1)
        XCTAssertTrue(favoriteRecipes.first?.id == validRecipe.id)

    }

}
