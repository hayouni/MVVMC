//
//  ServiceMock.swift
//  HelloFreshTests
//
//  Created by Saiefeddine HAYOUNI on 06/12/2021.
//

import Foundation
@testable import HelloFresh

class ServiceMock: ServiceProtocol {

    let bundle = Bundle(for: ServiceMock.self)

    func getRecepiesList(completion: @escaping (RecipeEntities?) -> Void) {
        do {
            if let bundlePath = bundle.path(forResource: "Recipes", ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                let decodedData = try JSONDecoder().decode(Recipes.self,
                                                           from: jsonData)
                completion(decodedData.asEntities)
            }
        } catch {
            print(error)
            completion([])
        }
    }
}
