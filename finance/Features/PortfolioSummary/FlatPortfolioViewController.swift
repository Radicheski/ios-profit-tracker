//
//  FlatPortfolioViewController.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 04/11/21.
//

import UIKit

class FlatPortfolioViewController: BaseViewController<PortfolioView> {

    var interactor: PortfolioManagerInteractorProtocol?
    var presenter: PortfolioManagerPresenterProtocol?
    var viewController: PortfolioManagerViewControllerProtocol?

    var data: [PortfolioItem] = []

    convenience init(parentId: UUID?) {
        self.init()

        self.navigationItem.title = "Flat"

        self.interactor = self
        self.presenter = self
        self.viewController = self

        self.interactor?.presenter = self.presenter
        self.presenter?.viewController = self.viewController

        self.interactor?.fetchTotalAllocated(parentId: nil)
        self.interactor?.loadData(parentId: nil)

        self.customView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "portfolio")
        self.customView.tableView.dataSource = self
    }

}

extension FlatPortfolioViewController: PortfolioManagerViewControllerProtocol {

    func updateView() {
        DispatchQueue.main.async { self.customView.tableView.reloadData() }
    }

    func updateTotalAllocated(value: Decimal) {
        self.customView.footerText = "Unallocated: \(100 - value * 100)%"
    }

}

extension FlatPortfolioViewController: PortfolioManagerPresenterProtocol {

    func load(data: [PortfolioItem]) {
        self.data = data
        self.viewController?.updateView()
    }

    func presentTotalAllocated(value: Decimal) {
        self.viewController?.updateTotalAllocated(value: value)
    }

}

extension FlatPortfolioViewController: PortfolioManagerInteractorProtocol {

    func loadData(parentId: UUID?) {
        let data = PortfolioItem.getItems(PortfolioMock.shared.data)
        self.presenter?.load(data: data)
    }

    func fetchTotalAllocated(parentId: UUID?) {
        let value = PortfolioItem.getItems(PortfolioMock.shared.data).map( { $0.weight } ).reduce(Decimal(), { $0 + $1 } )
        self.presenter?.presentTotalAllocated(value: value)
    }

}

extension FlatPortfolioViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "portfolio", for: indexPath)
        var conf = cell.defaultContentConfiguration()
        conf.text = self.data[indexPath.row].name
        conf.secondaryText = "\(self.data[indexPath.row].weight)"
        cell.contentConfiguration = conf
        return cell
    }

}