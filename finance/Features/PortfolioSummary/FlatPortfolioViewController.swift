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
    
    let parentId: UUID? = nil

    required convenience init(parentId: UUID?) {
        self.init()

        self.navigationItem.title = CustomLocalization.Summary.summaryTitle

        self.interactor = self
        self.presenter = self
        self.viewController = self

        self.interactor?.presenter = self.presenter
        self.presenter?.viewController = self.viewController

        self.interactor?.fetchTotalAllocated()
        self.interactor?.loadData()

        self.customView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "portfolio")
        self.customView.tableView.dataSource = self
    }

}

extension FlatPortfolioViewController: PortfolioManagerViewControllerProtocol {

    func updateView() {
        DispatchQueue.main.async { self.customView.tableView.reloadData() }
    }

    func updateTotalAllocated(value: Decimal) {
        let localizedString = CustomLocalization.Summary.summaryUnallocated
        let percentValue = Formatter.shared.percent.string(from: 100 - value * 100) ?? ""
        self.customView.footerText = String.localizedStringWithFormat(localizedString, percentValue as CVarArg)
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

    func loadData() {
        let data = PortfolioItem.getItems(PortfolioMock.shared.data)
        self.presenter?.load(data: data)
    }

    func fetchTotalAllocated() {
        let value = PortfolioItem.getItems(PortfolioMock.shared.data).map( { $0.weight } ).reduce(Decimal(), { $0 + $1 } )
        self.presenter?.presentTotalAllocated(value: value)
    }
    
    func insertData() {
        fatalError()
    }
    
    func removeData(at index: Int) {
        fatalError()
    }
    
    func updateData() {
        fatalError()
    }
    
    func getItem(at: Int) -> PortfolioItem {
        fatalError()
    }

}

extension FlatPortfolioViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "portfolio", for: indexPath)
        var conf = CustomContentConfiguration()
        conf.title = self.data[indexPath.row].name
        conf.weight = self.data[indexPath.row].weight
        conf.price = Decimal(Int.random(in: 10...30))
        cell.contentConfiguration = conf
        return cell
    }

}
