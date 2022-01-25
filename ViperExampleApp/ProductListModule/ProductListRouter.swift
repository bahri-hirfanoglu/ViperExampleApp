//
//  ProductListRouter.swift
//  ViperExampleApp
//
//  Created by Admin on 25.01.2022.
//

import Foundation
import UIKit

protocol ProductListRouterInterface {
    
}

class ProductListRouter: ProductListInteractor {
    weak var viewController: UIViewController?
    static func createModule() -> UIViewController {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(ProductListViewController.self)") as! ProductListViewController
        let interactor = ProductListInteractor()
        let router = ProductListRouter()
        let entities = ProductListEntities()
        let presenter = ProductListPresenter(view: view, interactor: interactor, router: router, entities: entities)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
}
