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

        self.interactor?.loadData()

        self.customView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "portfolio")
        self.customView.tableView.dataSource = self
    }

}

extension FlatPortfolioViewController: PortfolioManagerViewControllerProtocol {

    func updateView() {
        DispatchQueue.main.async { self.customView.tableView.reloadData() }
    }

}

extension FlatPortfolioViewController: PortfolioManagerPresenterProtocol {

    func load(data: [PortfolioItem]) {
        self.data = data
        self.viewController?.updateView()
    }

}

extension FlatPortfolioViewController: PortfolioManagerInteractorProtocol {

    func loadData() {
        let data = PortfolioItem.getItems(PortfolioMock.shared.data)
        self.presenter?.load(data: data)
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? self.data.count : 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "portfolio", for: indexPath)
        
        if indexPath.section == 0 {
            var conf = CustomContentConfiguration()
            conf.title = self.data[indexPath.row].name
            conf.weight = self.data[indexPath.row].weight
            cell.contentConfiguration = conf
        } else {
            var conf = cell.defaultContentConfiguration()
            conf.text = "Não alocado"
            conf.secondaryText = Formatter.shared.percent.string(from: Decimal())
            cell.contentConfiguration = conf
        }
        
        return cell
    }

}
