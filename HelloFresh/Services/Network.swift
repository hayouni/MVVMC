//
//  Network.swift
//  HelloFresh
//
//  Created by Saiefeddine HAYOUNI on 05/12/2021.
//
import UIKit

struct Network {
    static let shared = Network()
    // use T optional
    // when nil show error view
    // when != nil show recepies list
    func fetchData<T: Decodable>(urlString: String, completion:
                                            @escaping (T?) -> ()) {
        guard let url = URL(string: urlString) else { return }
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        config.timeoutIntervalForRequest = 6.0;

        let task =  URLSession(configuration: config).dataTask(with: url) { (data, _, err) in
            guard err == nil, let data = data else {
                completion(nil)
                return
            }
            do {
                let homeFeed = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion (homeFeed)
                }
            } catch _ {
                completion(nil)
            }
        }
        task.resume()
    }
}
