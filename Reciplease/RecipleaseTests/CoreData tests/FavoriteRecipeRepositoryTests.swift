
import XCTest
@testable import Reciplease
import CoreData

class FavoriteRecipeRepositoryTests: XCTestCase {

    var coreDataStack: CoreDataStackProtocol!
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
        XCTAssertEqual(validRecipe.recipeName, favoriteRecipes.first?.recipeName)
        XCTAssertEqual(validRecipe.imageUrl, favoriteRecipes.first?.imageUrl)
        XCTAssertEqual(validRecipe.formatedTotalTime, favoriteRecipes.first?.formatedTotalTime)
        XCTAssertEqual(validRecipe.formatedServings, favoriteRecipes.first?.formatedServings)
        XCTAssertEqual(validRecipe.formatedIngredientsPreview, favoriteRecipes.first?.formatedIngredientsPreview)
        XCTAssertEqual(validRecipe.formatedIngredientLines, favoriteRecipes.first?.formatedIngredientLines)
        XCTAssertEqual(validRecipe.imageUrl, favoriteRecipes.first?.imageUrl)
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
        XCTAssertEqual(favoriteRecipes.count, 1)
        XCTAssertEqual(favoriteRecipes.first?.id, firstRecipe.id)
    }

}
