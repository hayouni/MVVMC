//
//  HomeViewModelTests.swift
//  HelloFreshTests
//
//  Created by Saiefeddine HAYOUNI on 03/12/2021.
//

import XCTest
@testable import HelloFresh

class HomeViewModelTests: XCTestCase {

    var viewModel: HomeViewModel!
    var service: ServiceMock!
    let testEntity = RecipeEntity(name: "Moroccan Skirt Steak",
                                  headline: "with Spinach and Lemon Couscous",
                                  preparationMinutes: "30",
                                  image: URL(string: "https://img.hellofresh.com/f_auto,q_auto/hellofresh_s3/image/53314247ff604d44808b4569.jpg"),
                                  isSelected: false)
    
    var recipeModel: RecipeEntity?

    override func setUp() {
        self.service = ServiceMock()
        self.viewModel = HomeViewModel(service: self.service)
        self.viewModel.fetchData { Bool in
            self.recipeModel = self.viewModel.recipeModel(at: IndexPath(row: 1, section: 0))
        }
    }

    func testNumberOfItems() throws {
        XCTAssertEqual(self.viewModel.numberOfItems(), 10)
    }

    func testRecipeModel() throws {
        XCTAssertEqual(recipeModel?.name, testEntity.name )
        XCTAssertEqual(recipeModel?.headline, testEntity.headline )
        XCTAssertEqual(recipeModel?.preparationMinutes, testEntity.preparationMinutes )
        XCTAssertEqual(recipeModel?.image, testEntity.image )
        XCTAssertEqual(recipeModel?.isSelected, testEntity.isSelected )
    }

    func testRecipeSelection() throws {
        // initial value
        XCTAssertEqual(recipeModel?.isSelected, false)
        //select Recepie
        viewModel.didSelectRecipe(index: IndexPath(row: 1, section: 0), isSelected: true)
        recipeModel = self.viewModel.recipeModel(at: IndexPath(row: 1, section: 0))
        XCTAssertEqual(recipeModel?.isSelected, true)
        //deselect Recepie
        viewModel.didSelectRecipe(index: IndexPath(row: 1, section: 0), isSelected: false)
        recipeModel = self.viewModel.recipeModel(at: IndexPath(row: 1, section: 0))
        XCTAssertEqual(recipeModel?.isSelected, false)
    }
    
    func testSelectionCapability() throws {
        XCTAssertEqual(viewModel?.canSelect(isSelected: true), true)
        XCTAssertEqual(viewModel?.isSelected(index: IndexPath(row: 1, section: 0)), true)
    }
}
