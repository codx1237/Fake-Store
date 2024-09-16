//
//  ShopManager.swift
//  Shop App
//
//  Created by Fırat Ören on 6.09.2024.
//

import Foundation

@MainActor
class ShopManager: ObservableObject {
    @Published var products: [Product] = []
    @Published var filteredProducts: [Product] = []
    @Published var isLoading = true
    @Published var errorMessage: String?

    func fetchProducts() async {
        isLoading = true
        do{
            products = try await fetchProductsFromApi()
            isLoading = false
        }catch{
            errorMessage = error.localizedDescription
        }
    }

    

     func fetchProductsFromApi() async throws -> [Product] {
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            throw NetworkError.badUrl
        }

         let (data,response) = try await URLSession.shared.data(from: url)

         guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
             throw NetworkError.badRequest
         }
         
         guard let decodedResponse = try? JSONDecoder().decode([Product].self, from: data) else {
             throw NetworkError.decodingError
         }
         return decodedResponse
    }



}




enum NetworkError: Error {
    case badUrl
    case badRequest
    case decodingError
}
