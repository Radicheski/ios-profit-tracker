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

    let flatdatasource = FlatPortfolioDataSouce()

    var parentId: UUID?

    var data: [PortfolioItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "portfolioItem")
        if self.title == nil { self.title = "Global Portfolio"}
        if self.parentId == nil { self.customView.segmentedControl.isHidden = false }
        self.customView.tableView.dataSource = self.dataSource
        self.customView.tableView.delegate = self
        let value = self.data.map( { $0.weight } ).reduce(Decimal(), { $0 + $1 } )
        self.customView.footerText = "Unallocated: \(100 - value * 100)%"
        self.customView.segmentedControlAction = { [unowned self] control in
            if self.parentId == nil {
                switch control.selectedSegmentIndex {
                case 0:
                    self.customView.tableView.dataSource = self.dataSource
                    self.customView.tableView.delegate = self
                    let value = self.data.map( { $0.weight } ).reduce(Decimal(), { $0 + $1 } )
                    self.customView.footerText = "Unallocated: \(100 - value * 100)%"
                case 1:
                    self.customView.tableView.dataSource = self.flatdatasource
                    self.customView.tableView.delegate = nil
                    let value = self.flatdatasource.source.map( { $0.weight } ).reduce(Decimal(), { $0 + $1 } )
                    self.customView.footerText = "Unallocated: \(100 - value * 100)%"
                default: break
                }
                self.updateView()
            }
        }
        self.interactor?.loadData(parentId: self.parentId)
    }
    
    convenience init(parentId: UUID?) {
        self.init()
        self.parentId = parentId

        self.interactor?.presenter = self.presenter
        self.presenter?.viewController = self

        self.interactor?.loadData(parentId: parentId)
    }
    
}

extension PortfolioViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let dataSource = self.presenter as? PortfolioManagerDataSource {
            let selectedItem = dataSource.data[indexPath.row]
            let vc = PortfolioViewController(parentId: selectedItem.id)
            vc.title = selectedItem.name
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

class FlatPortfolioDataSouce: NSObject, UITableViewDataSource {
    
    var source: [PortfolioItem] {
        get {
            return PortfolioItem.getItems(PortfolioMock.shared.data).sorted(by: { $0.name < $1.name } )
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return source.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "portfolioItem", for: indexPath)
        var conf = cell.defaultContentConfiguration()
        conf.text = self.source[indexPath.row].name
        conf.secondaryText = "\(self.source[indexPath.row].weight)"
        cell.contentConfiguration = conf
        return cell
    }
    
}

extension PortfolioViewController: PortfolioManagerViewControllerProtocol {

    func updateView() {
        DispatchQueue.main.async { self.customView.tableView.reloadData() }
    }

}
