//
//  Extension.swift
//  HelloFresh
//
//  Created by Saiefeddine HAYOUNI on 06/12/2021.
//
import UIKit

public extension UITableView {

    func registerNibCell<T: UITableViewCell>(ofType type: T.Type) {
        let nib = UINib(nibName: String(describing: type), bundle: Bundle(for: type))
        register(nib, forCellReuseIdentifier: type.reuseIdentifier)
    }
    func dequeueReusableCell<T: UITableViewCell>(ofType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Cannot create reusable cell with type \(String(describing: self))). Did you register the cell for the table view? Did you set the cell identifier right?")
        }
        return cell
    }
}

public extension UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global(qos: .background).async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
    }
}

extension Recipe {
    var asEntity: RecipeEntity {

        return RecipeEntity(name: name,
                              headline: headline,
                              preparationMinutes: "\(preparationMinutes)",
                              image: URL(string: image),
                              isSelected: false)
    }
}

extension Recipes {
    var asEntities: RecipeEntities {
        map { $0.asEntity }
    }
}
