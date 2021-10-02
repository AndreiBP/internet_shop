//
//  ProductSizeTableViewCell.swift
//  blackstarshop
//
//  Created by Андрей Балобанов on 30.09.2021.
//

import UIKit

class ProductSizeTableViewCell: UITableViewCell {

    @IBOutlet weak var sizeProduct: UILabel!
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var contentViewCell: UIView!
    
    
    var infoproduct: Offers? {
        didSet {
            sizeProduct.text = infoproduct?.size
        }
    }
  
    override func awakeFromNib() {
        super.awakeFromNib()
        viewCell.layer.cornerRadius = 10
        contentViewCell.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
