//
//  HomeViewControllerTests.swift
//  HelloFreshTests
//
//  Created by Saiefeddine HAYOUNI on 06/12/2021.
//


import XCTest
@testable import HelloFresh

class HomeViewControllerTests: XCTestCase {

    var viewModel: HomeViewModel!
    var homeViewController: HomeViewController!
    var service: ServiceMock!

    var recipeModel: RecipeEntity?

    override func setUp() {
        self.service = ServiceMock()
        self.viewModel = HomeViewModel(service: self.service)

        let instance = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HelloFresh.HomeViewController)!

        instance.loadView()
        instance.viewModel = HomeViewModel(service: self.service)
        instance.viewDidLoad()
        homeViewController = instance

    }

    func testNumberOfItems() throws {
        XCTAssertEqual(homeViewController.tableView.numberOfRows(inSection: 0), 10)
    }

    func testSelectItems() throws {
        homeViewController.tableView.selectRow(at: IndexPath(row: 0, section: 1), animated: false, scrollPosition: .none)
        XCTAssertEqual(homeViewController.viewModel?.isSelected(index: IndexPath(row: 0, section: 1)), true)
    }

    func testCanSelectItems() throws {
        homeViewController.tableView.selectRow(at: IndexPath(row: 0, section: 1), animated: false, scrollPosition: .none)
        XCTAssertEqual(homeViewController.viewModel?.canSelect(isSelected: true), true)
    }
}
