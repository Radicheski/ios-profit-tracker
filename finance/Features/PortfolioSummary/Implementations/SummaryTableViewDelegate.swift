//
//  SummaryTableViewDelegate.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 22/01/22.
//

import UIKit

class SummaryTableViewDelegate: NSObject, UITableViewDelegate {
    weak var viewController: SummaryViewProtocol?

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
