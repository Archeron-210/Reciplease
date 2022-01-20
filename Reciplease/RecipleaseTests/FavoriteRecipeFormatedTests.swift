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

        func testBlabla() {

            XCTAssertEqual(favoriteRecipe.recipeName, "Chicken Vesuvio")

        }

        func testBlabla2() {

            XCTAssertEqual(favoriteRecipe.recipeName, "Chicken Vesuvio")

        }

}
