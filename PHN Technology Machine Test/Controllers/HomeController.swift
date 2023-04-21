//
//  HomeController.swift
//  PHN Technology Machine Test
//
//  Created by Mac on 21/04/23.
//

import UIKit

class HomeController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   let productManager = ProductManager(userNetworkRepository: NetworkManager())
    var products = [Product]()
    @IBOutlet weak var productTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productTableView.delegate = self
        productTableView.dataSource = self
        productManager.getUser(url: EndPoints.url) { (products) in
            print(products)
            self.products = products
            DispatchQueue.main.async {
                self.productTableView.reloadData()
            }
        }
    }
}

extension HomeController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productCell = productTableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductCell
        let productName = products[indexPath.row].category.name.rawValue
        let url = URL(string: products[indexPath.row].images.first!)
        productCell.title.text = products[indexPath.row].title
        productCell.name.text = productName
        productCell.price.text = String(products[indexPath.row].price)
        productCell.productImage.loadImage(imageUrl: url!, placeholdetImage: "product")
        return productCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productDetailsVC = storyboard?.instantiateViewController(identifier: "ProductDetailsController") as! ProductDetailsController
        productDetailsVC.productTitle = products[indexPath.row].title
        productDetailsVC.productImage = products[indexPath.row].images.first
        productDetailsVC.productDiscription = products[indexPath.row].description
        productDetailsVC.productPrice = String(products[indexPath.row].price)
        productDetailsVC.productCatagory = products[indexPath.row].category.name.rawValue
        navigationController?.pushViewController(productDetailsVC, animated: true)
    }
}
