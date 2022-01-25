//
//  ProductType.swift
//  ViperExampleApp
//
//  Created by Admin on 25.01.2022.
//

import Foundation

struct ProductType: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating

}

struct Rating: Codable {
    let rate: Double
    let count: Int
}
