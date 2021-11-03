//
//  PortfolioViewController.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 28/10/21.
//

import UIKit

class PortfolioViewController: BaseViewController<PortfolioView> {
    
    var worker = PortfolioItemWorker(parentId: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "portfolioItem")
        if self.title == nil { self.title = "Global Portfolio"}
        self.customView.tableView.dataSource = self
        self.customView.tableView.delegate = self
        self.customView.tableView.tableFooterView = self.getFooter()
    }
    
    func getFooter() -> UIView? {
        let footer = UILabel()
        footer.backgroundColor = .yellow
        footer.textAlignment = .center
        footer.frame = CGRect(x: 0, y: 0, width: self.customView.tableView.frame.width, height: 40)
        let value = self.worker.items.map( { $0.weight } ).reduce(Decimal(), { $0 + $1 } )
        footer.text = "Unallocated: \(100 - value * 100)%"
        return footer
    }
    
    convenience init(parentId: UUID?) {
        self.init()
        self.worker = PortfolioItemWorker(parentId: parentId)
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
        let vc = PortfolioViewController(parentId: self.worker.items[indexPath.row].id)
        vc.title = self.worker.items[indexPath.row].name
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
