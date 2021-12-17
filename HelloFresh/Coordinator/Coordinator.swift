//
//  Coordinator   .swift
//  HelloFresh
//
//  Created by Saiefeddine HAYOUNI on 06/12/2021.
//

import Foundation
import UIKit

public protocol CoordinatorProtocol : AnyObject {
    // All coordinators will be initilised with a navigation controller
    init(navigationController:UINavigationController)
    func start()
}

class Coordinator: CoordinatorProtocol {

    unowned let rootController:UINavigationController
    // initiate navigationController
    required init(navigationController: UINavigationController) {
        self.rootController = navigationController
    }

    // start Coordinator
    func start() {
        let homeViewController = HomeViewController.instantiate()
        homeViewController.viewModel = HomeViewModel(service: Service.shared)
        rootController.setViewControllers([homeViewController], animated: false)
    }
}
