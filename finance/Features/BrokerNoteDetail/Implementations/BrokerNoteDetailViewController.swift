//
//  BrokerNoteDetailViewController.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 31/01/22.
//

import Foundation
import UIKit

class BrokerNoteDetailViewController: FormViewController, BrokerNoteDetailViewProtocol {

    var interactor: BrokerNoteDetailInteractorProtocol
    var router: BrokerNoteDetailRouterProtocol

    var saveAction: ((UIAction) -> Void) = { _ in }

    init(interactor: BrokerNoteDetailInteractorProtocol, router: BrokerNoteDetailRouterProtocol) {
        self.interactor = interactor
        self.router = router

        super.init(nibName: nil, bundle: nil)
        let barButtonItem = UIBarButtonItem(systemItem: .save, primaryAction: UIAction(handler: self.save), menu: nil)
        self.navigationItem.rightBarButtonItem = barButtonItem
    }

    required init?(coder: NSCoder) {
        return nil
    }

    func insertTransaction() {
        self.interactor.insertTransaction()
    }

    func loadData() {
        self.interactor.loadData()
    }

    func presentData(item: [Section]) {
        self.dataSource.setSections(item)
        self.dataSource.register(in: self.customView.tableView)

        item.filter { $0.key == BrokerNoteDetailSections.transactions.rawValue }
        .flatMap { $0.rows }
        .filter { $0.key != "newTransaction" }
        .map { $0 as? Transaction.ViewModel }
        .forEach { [weak self] transaction in
            if let transaction = transaction {
                transaction.didSelect = { [weak self] _, _ in
                    self?.present(transaction: transaction)
                }
            }
        }
        let section = BrokerNoteDetailSections.transactions.rawValue
        let row = self.dataSource.getRow(fromSection: section, withKey: "newTransaction")
        row?.didSelect = { [weak self] _, _ in self?.insertTransaction() }

        self.customView.tableView.reloadData()
    }

    func save(_ action: UIAction) {
        self.saveAction(action)
        self.interactor.save()
        self.navigationController?.popViewController(animated: true)
    }

    func insertTransaction(_ transaction: Row) {
        let section = BrokerNoteDetailSections.transactions.rawValue
        self.dataSource.insert(row: transaction, forSectionKey: section, before: "newTransaction")
        self.customView.tableView.reloadSections(IndexSet(integer: 1), with: .automatic)
    }

    func present(transaction: Transaction.ViewModel) {
        self.router.present(transaction: transaction)
    }

}
