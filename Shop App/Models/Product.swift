//
//  Shop.swift
//  Shop App
//
//  Created by Fırat Ören on 6.09.2024.
//

import Foundation

struct Product: Decodable,Identifiable,Hashable{
//    static func == (lhs: Product, rhs: Product) -> Bool {
//        lhs.id == rhs.id
//    }
//    

    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating

    struct Rating: Decodable,Hashable {
        let rate: Double
        let count: Int
    }
}



