//
//  UserNetworkViewModel.swift
//  PHN Technology Machine Test
//
//  Created by Mac on 21/04/23.
//

import Foundation
struct ProductManager{
    private let productNetworkRepository : NetworkRepository
    init(userNetworkRepository : NetworkRepository) {
        self.productNetworkRepository = userNetworkRepository
    }
    func getUser(url : String, completionHandler : @escaping ([Product])->()){
        productNetworkRepository.getProduct(url: url) { (products) in
            completionHandler(products)
        }
    }
}
