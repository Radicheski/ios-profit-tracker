//
//  PortfolioViewController.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 28/10/21.
//

import UIKit

class PortfolioViewController: BaseViewController<PortfolioView> {

    var interactor: PortfolioManagerInteractorProtocol? = PortfolioMock.shared
    var presenter: PortfolioManagerPresenterProtocol? = PortfolioManagerDataSource()
    var viewController: PortfolioManagerViewControllerProtocol? {
        get {
            return self
        }
        set {}
    }

    var dataSource: UITableViewDataSource? {
        get {
            return self.presenter as? UITableViewDataSource
        }
    }

    let flatdatasource = FlatPortfolioDataSource()

    var parentId: UUID?

    var data: [PortfolioItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "portfolioItem")
        if self.navigationItem.title == nil { self.navigationItem.title = CustomLocalization.PortfolioManager.globalPortfolioTitle }
        self.customView.tableView.dataSource = self.dataSource
        self.customView.tableView.delegate = self
    }
    
    convenience init(parentId: UUID?) {
        self.init()
        self.parentId = parentId

        self.interactor?.presenter = self.presenter
        self.presenter?.viewController = self

        self.interactor?.loadData(parentId: parentId)
        self.interactor?.fetchTotalAllocated(parentId: self.parentId)
    }
    
}

extension PortfolioViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let dataSource = self.presenter as? PortfolioManagerDataSource {
            let selectedItem = dataSource.data[indexPath.row]
            let vc = PortfolioViewController(parentId: selectedItem.id)
            vc.navigationItem.title = selectedItem.name
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

extension PortfolioViewController: PortfolioManagerViewControllerProtocol {

    func updateView() {
        DispatchQueue.main.async { self.customView.tableView.reloadData() }
    }

    func updateTotalAllocated(value: Decimal) {
        let localizedString = CustomLocalization.PortfolioManager.globalPortfolioUnallocated
        let percentValue = 100 - value * 100
        self.customView.footerText = String.localizedStringWithFormat(localizedString, [percentValue])
    }

}
