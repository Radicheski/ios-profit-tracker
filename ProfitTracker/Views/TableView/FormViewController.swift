//
//  FormViewController.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 26/01/22.
//

import Foundation
import UIKit

class FormViewController: BaseViewController<PortfolioView> {

    var dataSource = SectionDataSource()

    override func viewDidLoad() {
        self.customView.tableView.delegate = self.dataSource
        self.customView.tableView.dataSource = self.dataSource
    }

    func registerSections() {
        self.dataSource.register(in: self.customView.tableView)
    }

}
