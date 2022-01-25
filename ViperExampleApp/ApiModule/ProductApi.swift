//
//  ProductApi.swift
//  ViperExampleApp
//
//  Created by Admin on 25.01.2022.
//

import Foundation

enum urlPath: String {
    case allProducts = "products"
    case allCategories =  "categories"
}

class ProductApi {
    
    public var baseURL = "https://fakestoreapi.com/"
    
    func getProductsURL() -> URL {
        return URL(string: "\(self.baseURL)\(urlPath.allProducts.rawValue)")!
    }
    
    func getProducts(onSuccess: @escaping ([ProductType]) -> Void, onError: @escaping (Error) -> Void) {
        let url = getProductsURL()
        ApiTask().request(url: url, onSuccess: { data, response in
            do {
                let result = try self.parse(data)
                onSuccess(result)
            } catch {
                onError(ApiError.failedParse)
            }
        }, onError: onError)
    }
    
    func getCategories(onSuccess: @escaping ([String]) -> Void, onError: @escaping (Error) -> Void){
        
    }
    
    private func parse(_ data: Data) throws -> [ProductType] {
        let response = try JSONDecoder().decode([ProductType].self, from: data)
        return response
    }
}
