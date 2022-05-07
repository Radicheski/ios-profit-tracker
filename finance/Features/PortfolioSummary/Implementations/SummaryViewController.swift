//
//  SummaryViewController.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 23/01/22.
//

import Foundation
import UIKit

class SummaryViewController: BaseViewController<PortfolioView>, SummaryViewProtocol {

    var interactor: SummaryInteractorProtocol
    var router: SummaryRouterProtocol

    var datasource: SummaryTableViewDataSource? {
        didSet { self.customView.tableView.dataSource = self.datasource }
    }
    var delegate: SummaryTableViewDelegate? {
        didSet { self.customView.tableView.delegate = self.delegate }
    }

    func loadData() {
        self.interactor.loadData()
    }

    func updateView(with data: [SummaryItem.ViewModel]) {
        self.datasource?.data = data
        let sections = IndexSet(0..<self.customView.tableView.numberOfSections)
        self.customView.tableView.reloadSections(sections, with: .automatic)
    }

    init(interactor: SummaryInteractorProtocol, router: SummaryRouterProtocol) {
        self.interactor = interactor
        self.router = router

        self.datasource = SummaryTableViewDataSource()
        self.delegate = SummaryTableViewDelegate()

        super.init(nibName: nil, bundle: nil)
        self.customView.tableView.dataSource = self.datasource
        self.datasource?.viewController = self

        self.customView.tableView.delegate = self.delegate
        self.delegate?.viewController = self

        if self.navigationItem.title == nil { self.navigationItem.title = SummaryStrings.summaryTitle.localizedString }

        self.customView.tableView.register(UITableViewCell.self)
    }

    required init?(coder: NSCoder) {
        nil
    }

}
