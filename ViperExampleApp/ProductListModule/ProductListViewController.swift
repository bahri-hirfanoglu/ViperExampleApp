//
//  ViewController.swift
//  ViperExampleApp
//
//  Created by Admin on 25.01.2022.
//

import UIKit

protocol ProductListViewInterface {
    var presenter: ProductListPresenterInterface! { get set }
    func reloadData()
    func showLoadingIndicator()
    func hideLoadingIndicator()
}
class ProductListViewController: UIViewController, ProductListViewInterface {

    var presenter: ProductListPresenterInterface!
    @IBOutlet weak var productTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productTableView.delegate = self
        productTableView.dataSource = self
        presenter?.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        showLoadingIndicator()
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.hideLoadingIndicator()
            self.productTableView.reloadData()
        }
    }
    
    func showLoadingIndicator() {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating();
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
    
    func hideLoadingIndicator() {
        dismiss(animated: false, completion: nil)
    }

}

