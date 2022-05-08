//
//  BrokerNoteDetailPresenter.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 31/01/22.
//

import UIKit

class BrokerNoteDetailPresenter: BrokerNoteDetailPresenterProtocol {

    weak var view: BrokerNoteDetailViewProtocol?

    func loadData(note: BrokerNote) {
        let item = BrokerNote.ViewModel(from: note)

        let section: Section = item

        var transactionRows = item.transactions
        let newTransaction = TextInputFormField(key: "newTransaction",
                                                value: Box(nil),
                                                contentConfiguration: .init(title: "Nova transação", placeholder: nil))
        transactionRows.append(newTransaction)

        let transactionSection = TableViewSection(key: BrokerNoteDetailSections.transactions.rawValue,
                                                  rows: transactionRows)
        transactionSection.headerTitle = "Transações"

        let leftBarButton = UIBarButtonItem(systemItem: .cancel,
                                            primaryAction: UIAction(handler: self.action(_:)),
                                            menu: nil)
        self.view?.navigationItem.leftBarButtonItem = leftBarButton

        self.view?.saveAction = item.saveAction(_:)

        self.view?.presentData(item: [section, transactionSection])
    }

    func action( _ action: UIAction) {
        self.view?.navigationController?.popViewController(animated: true)
    }

    func insertTransaction(_ transaction: Transaction) {
        self.view?.insertTransaction(Transaction.ViewModel(from: transaction))
    }

}

enum BrokerNoteDetailSections: String {
    case header
    case transactions
}
