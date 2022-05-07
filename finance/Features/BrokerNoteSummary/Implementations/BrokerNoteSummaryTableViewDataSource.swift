//
//  BrokerNoteSummaryTableViewDataSource.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 25/01/22.
//

import UIKit

class BrokerNoteSummaryTableViewDataSource: NSObject, UITableViewDataSource {
    weak var viewController: BrokerNoteSummaryViewProtocol?
    var data: [BrokerNote.ViewModel] = []

    func numberOfSections(in tableView: UITableView) -> Int {
        return tableView.isEditing ? 2 : 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.isEditing && section == 0 {
            return 1
        } else {
            return self.data.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(UITableViewCell.self, for: indexPath)
        if tableView.isEditing && indexPath.section == 0 {
            var conf = cell.defaultContentConfiguration()
            conf.text = BrokerNoteStrings.brokerNotesNewItem.localizedString
            cell.contentConfiguration = conf
        } else {
            let item = self.data[indexPath.row]
            let conf = BrokerNoteContentConfiguration(from: item)
            cell.contentConfiguration = conf
        }
        return cell
    }

    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.viewController?.delete(fromIndex: indexPath.row)
        }
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return tableView.isEditing ? indexPath.section == 1 : indexPath.section == 0
    }

}
