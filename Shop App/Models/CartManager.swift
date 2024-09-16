//
//  Cart.swift
//  Shop App
//
//  Created by Fırat Ören on 10.09.2024.
//

import Foundation


class CartManager: ObservableObject {
    @Published var cart: [Product] = []



    func AddToCart(product: Product) {
        cart.append(product)
    }

    func removeFromCart(id: Int) {
        cart.remove(at: id)
    }

    func emptyCart() {
        cart.removeAll()
    }




}
