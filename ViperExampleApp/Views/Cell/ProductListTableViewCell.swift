//
//  ProductListTableViewCell.swift
//  ViperExampleApp
//
//  Created by Admin on 25.01.2022.
//

import UIKit

class ProductListTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productCategoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(product: ProductType) {
        productImageView.loadImage(from: product.image, UIImage(named: "404"))
        productNameLabel.text = product.title
        productCategoryLabel.text = product.category
        productPriceLabel.text = "\(product.price)$"
    }

}
