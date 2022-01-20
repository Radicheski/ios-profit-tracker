//
//  SummaryViewController+PortfolioManagerViewControllerProtocol.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 12/01/22.
//

import Foundation

extension SummaryViewController: PortfolioManagerViewControllerProtocol {

    func updateView() {
        DispatchQueue.main.async { self.customView.tableView.reloadData() }
    }

}
