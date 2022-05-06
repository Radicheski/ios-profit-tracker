//
//  BrokerNoteSummaryViewController.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 25/01/22.
//

import Foundation
import UIKit

class BrokerNoteSummaryViewController: BaseViewController<PortfolioView>, BrokerNoteSummaryViewProtocol {
    var interactor: BrokerNoteSummaryInteractorProtocol
    var router: BrokerNoteSummaryRouterProtocol

    var datasource: BrokerNoteSummaryTableViewDataSource
    var delegate: BrokerNoteSummaryTableViewDelegate

    init(interactor: BrokerNoteSummaryInteractorProtocol, router: BrokerNoteSummaryRouterProtocol) {
        self.interactor = interactor
        self.router = router

        self.datasource = BrokerNoteSummaryTableViewDataSource()
        self.delegate = BrokerNoteSummaryTableViewDelegate()

        super.init(nibName: nil, bundle: nil)

        self.datasource.viewController = self
        self.customView.tableView.dataSource = self.datasource
        self.delegate.viewController = self
        self.customView.tableView.delegate = self.delegate

        self.customView.tableView.allowsSelectionDuringEditing = true

        if self.navigationItem.title == nil {
            self.navigationItem.title = CustomLocalization.BrokerNotes.brokerNotesTitle
        }

        self.customView.tableView.register(UITableViewCell.self)
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func setEditing(_ editing: Bool, animated: Bool) {
        self.customView.tableView.setEditing(editing, animated: animated)
        super.setEditing(editing, animated: animated)
        let sectionIndex = IndexSet(arrayLiteral: 0)
        if editing {
            let leftBarButton = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                target: self,
                                                action: #selector(cancelEdit))
            self.navigationItem.setLeftBarButton(leftBarButton, animated: true)
            self.customView.tableView.insertSections(sectionIndex, with: .left)
        } else {
            self.navigationItem.setLeftBarButton(nil, animated: true)
            self.interactor.save()
            self.customView.tableView.deleteSections(sectionIndex, with: .left)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.loadData()
        super.viewWillAppear(animated)
    }

    @objc func cancelEdit() {
        self.interactor.discard()
        self.setEditing(false, animated: true)
    }

    required init?(coder: NSCoder) {
        return nil
    }

    func loadData() {
        self.interactor.loadData()
    }

    func loadData(_ data: [BrokerNote.ViewModel]) {
        self.datasource.data = data
        let sections = IndexSet(0..<self.customView.tableView.numberOfSections)
        self.customView.tableView.reloadSections(sections, with: .automatic)
    }

    func insert() {
        self.interactor.insert()
    }

    func present(fromIndex index: Int) {
        self.interactor.present(fromIndex: index)
    }

    func present(item: BrokerNote.ViewModel) {
        self.router.present(item: item)
    }

    func delete(fromIndex index: Int) {
        self.interactor.delete(fromIndex: index)
    }

}
