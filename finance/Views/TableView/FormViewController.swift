//
//  FormViewController.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 26/01/22.
//

import Foundation
import UIKit

class FormViewController: BaseViewController<PortfolioView> {
    
    var data: [FormField] = [] {
        didSet {
            self.data.forEach { $0.register(self.customView.tableView) }
            self.customView.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        self.customView.tableView.delegate = self
        self.customView.tableView.dataSource = self
    }
    
}

extension FormViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
}

extension FormViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let field = self.data[indexPath.row]
        return field.dequeue(tableView, for: indexPath)
    }
    
}
