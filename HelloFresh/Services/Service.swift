//
//  Service.swift
//  HelloFresh
//
//  Created by Saiefeddine HAYOUNI on 06/12/2021.
//

import Foundation

protocol ServiceProtocol: AnyObject {
    func getRecepiesList(completion: @escaping (RecipeEntities?) -> Void)
}

class Service: ServiceProtocol {

    static let shared = Service()
    struct K {
        static let urlString = "https://hf-mobile-app.s3-eu-west-1.amazonaws.com/ios/recipes_v3.json"
    }

    /// fetch Recepies List
    /// - Parameter completion: RecipeEntities?
    func getRecepiesList(completion: @escaping (RecipeEntities?) -> Void) {
        Network.shared.fetchData(urlString: K.urlString) { (feed : Recipes?) in
            guard let recipes = feed else {
                completion(nil)
                return
            }
            // use entities to reveale only needed items of object by the viewModel/contoller
            completion(recipes.asEntities)
        }
    }

}
