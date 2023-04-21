//
//  ProductCell.swift
//  PHN Technology Machine Test
//
//  Created by Mac on 21/04/23.
//

import UIKit

class ProductCell: UITableViewCell {
    @IBOutlet weak var productImage: LazyImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
