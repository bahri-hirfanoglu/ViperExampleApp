//
//  ProductListInteractor.swift
//  ViperExampleApp
//
//  Created by Admin on 25.01.2022.
//

import Foundation

protocol ProductListInteractorOutput {
    func onFetchProductSuccess(products: [ProductType])
    func onFetchProductFailure(error: Error)
}

protocol ProductListInteractorInput {
    var presenter: ProductListInteractorOutput? {get set}
    func fetchProducts()
}

class ProductListInteractor: ProductListInteractorInput {
    var presenter: ProductListInteractorOutput?
    
    func fetchProducts() {
        ProductApi().getProducts(onSuccess: { [weak self] res in
            self?.presenter?.onFetchProductSuccess(products: res)
        }) { [weak self] error in
            self?.presenter?.onFetchProductFailure(error: error)
            print(error)
        }
        
    }
    
    
}
