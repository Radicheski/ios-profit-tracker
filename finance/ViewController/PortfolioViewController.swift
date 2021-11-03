//
//  PortfolioViewController.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 28/10/21.
//

import UIKit

class PortfolioViewController: BaseViewController<PortfolioView> {
    var interactor: PortfolioManagerInteractorProtocol? = PortfolioMock.shared
    var parentId: UUID?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "portfolioItem")
        if self.title == nil { self.title = "Global Portfolio"}
        if worker.parentId == nil { self.customView.segmentedControl.isHidden = false }
        self.customView.tableView.dataSource = self
        self.customView.tableView.delegate = self
        let value = self.worker.items.map( { $0.weight } ).reduce(Decimal(), { $0 + $1 } )
        self.customView.footerText = "Unallocated: \(100 - value * 100)%"
        self.interactor?.loadData(parentId: self.parentId)
    }
    
    convenience init(parentId: UUID?) {
        self.init()
        self.parentId = parentId
    }
    
    }
    
}


extension PortfolioViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.worker.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "portfolioItem", for: indexPath)
        var conf = cell.defaultContentConfiguration()
        conf.text = self.worker.items[indexPath.row].name
        conf.secondaryText = "\(self.worker.items[indexPath.row].weight)"
        cell.contentConfiguration = conf
        return cell
    }
    
}

extension PortfolioViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = self.worker.items[indexPath.row]
        let worker = PortfolioItemWorker(parentId: selectedItem.id)
        if worker.items.isEmpty { return }
        let vc = PortfolioViewController(worker: worker)
        vc.title = selectedItem.name
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension PortfolioViewController: PortfolioManagerViewControllerProtocol {

    func updateView() {
        DispatchQueue.main.async { self.customView.tableView.reloadData() }
    }

}
