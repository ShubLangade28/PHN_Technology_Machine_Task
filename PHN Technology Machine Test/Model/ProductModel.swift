//
//  UserNetworkModel.swift
//  PHN Technology Machine Test
//
//  Created by Mac on 21/04/23.
//

import Foundation
// MARK: - UserElement
struct Product: Codable {
    let id: Int
    let title: String
    let price: Int
    let description: String
    let images: [String]
    let creationAt, updatedAt: String
    let category: Category
}

// MARK: - Category
struct Category: Codable {
    let id: Int
    let name: Name
    let image: String
    let creationAt, updatedAt: At
}

enum At: String, Codable {
    case the20230421T113944000Z = "2023-04-21T11:39:44.000Z"
}

enum Name: String, Codable {
    case clothes = "Clothes"
    case electronics = "Electronics"
    case furniture = "Furniture"
    case others = "Others"
    case shoes = "Shoes"
}
