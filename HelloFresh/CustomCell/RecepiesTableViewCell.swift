//
//  RecepiesTableViewCell.swift
//  HelloFresh
//
//  Created by Saiefeddine HAYOUNI on 06/12/2021.
//

import UIKit

class RecepiesTableViewCell: UITableViewCell {

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var backGroundImage: UIImageView!

    struct K {
        static let borderWidth: CGFloat = 4
        static let placeholder: String = "placeholder"
        static let borderColor = UIColor(red: 109/255.0, green: 143/255.0, blue: 59/255.0, alpha: 1).cgColor
    }
}
// MARK: - RecepiesTableViewCell
extension RecepiesTableViewCell {

    // MARK: - Configurations
    public func setup(model: RecipeEntity?) {
        guard let model = model else { return }
        backGroundImage.image = UIImage(named: K.placeholder)
        title.text = model.name
        subtitle.text = model.headline
        timer.text = model.preparationMinutes
        setBorder(hasBorder: model.isSelected ?? false)
        if let url = model.image {
            backGroundImage.load(url: url)
        }
    }

    /// trigger set border when select recepie
    /// - Parameter isSelected: Bool
    public func didSelectRecepie(isSelected : Bool)  {
         setBorder(hasBorder: isSelected)
    }

    /// set Border when the cell is selected
    /// - Parameter hasBorder: Bool
    private func setBorder(hasBorder: Bool) {
        container.layer.borderWidth = hasBorder ? K.borderWidth : 0
        container.layer.borderColor = K.borderColor
    }
}
