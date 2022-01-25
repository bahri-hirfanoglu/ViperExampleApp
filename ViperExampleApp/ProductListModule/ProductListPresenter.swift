//
//  ProductListPresenter.swift
//  ViperExampleApp
//
//  Created by Admin on 25.01.2022.
//

import Foundation

protocol ProductListPresenterInterface {
    var view: ProductListViewInterface? {get set}
    var numberOfRows: Int {get}
    func viewDidLoad()
    func configure(cell: ProductListTableViewCell, indexPath: IndexPath)
}

class ProductListPresenter: ProductListPresenterInterface, ProductListInteractorOutput {
    var view: ProductListViewInterface?
    private let interactor: ProductListInteractorInput
    private let router: ProductListRouter
    private let entities: ProductListEntities
    
    var numberOfRows: Int {
        return entities.productList.count
       }
    
    init(view: ProductListViewInterface, interactor: ProductListInteractorInput, router: ProductListRouter, entities: ProductListEntities) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.entities = entities
    }
    
    func viewDidLoad() {
        interactor.fetchProducts()
    }
    
    
    func configure(cell: ProductListTableViewCell, indexPath: IndexPath) {
        let product = entities.productList[indexPath.row]
        cell.configure(product: product)
    }
    
    func onFetchProductSuccess(products: [ProductType]) {
        entities.productList = products
        view?.reloadData()
    }
    
    func onFetchProductFailure(error: Error) {
        
    }
}
