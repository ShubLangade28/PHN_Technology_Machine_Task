//
//  ProductDetailsController.swift
//  PHN Technology Machine Test
//
//  Created by Mac on 21/04/23.
//

import UIKit

class ProductDetailsController: UIViewController {
    var productTitle = ""
    var productImage : String?
    var productDiscription : String?
    var productPrice : String?
    var productCatagory : String?
    
    @IBOutlet weak var productImageView: LazyImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var catagoryLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: productImage!)
        titleLabel.text = productTitle
        productImageView.loadImage(imageUrl: url!, placeholdetImage: "product")
        discriptionLabel.text = productDiscription
        priceLabel.text = productPrice
        catagoryLabel.text = productCatagory
        
    }


}
