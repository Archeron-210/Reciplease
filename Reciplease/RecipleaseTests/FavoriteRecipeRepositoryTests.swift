
import XCTest
@testable import Reciplease
import CoreData

class FavoriteRecipeRepositoryTests: XCTestCase {

    var coreDataStack: CoreDataStack!
    var repository: FavoriteRecipeRepository!

    override func setUp() {
        super.setUp()
        coreDataStack = CoreDataTestStack()
        repository = FavoriteRecipeRepository(coreDataStack: coreDataStack)
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
        XCTAssertTrue(!favoriteRecipes.isEmpty)
        XCTAssertEqual(favoriteRecipes.count, 1)
        XCTAssertEqual(favoriteRecipes.first?.id, validRecipe.id)

    }

    func testGivenARecipeIsSaved_WhenDeleting_ThenTheRecipeIsCorrectlyDeleted() {

        let recipe = FakeRecipes.correctRecipeDetail()
        repository.saveRecipe(recipe: recipe)

        repository.deleteRecipe(recipe: recipe)

        let favoriteRecipes = repository.getRecipes()
        XCTAssertTrue(favoriteRecipes.isEmpty)
    }

    func testGivenARecipeIsAlreadyAFavorite_WhenSaving_ThenTheRecipeIsNotSavedAgain() {

        let firstRecipe = FakeRecipes.correctRecipeDetail()
        repository.saveRecipe(recipe: firstRecipe)
        let secondRecipe = FakeRecipes.correctRecipeDetail()

        repository.saveRecipe(recipe: secondRecipe)

        let favoriteRecipes = repository.getRecipes()
        XCTAssertNotEqual(favoriteRecipes.count, 2)
        XCTAssertEqual(favoriteRecipes.count, 1)
        XCTAssertEqual(favoriteRecipes.first?.id, firstRecipe.id)

    }

}
