//
//  SummaryViewController.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 04/11/21.
//

import UIKit

class SummaryViewController: BaseViewController<PortfolioView> {

    var interactor: OldPortfolioManagerInteractorProtocol?
    var presenter: OldPortfolioManagerPresenterProtocol?
    var viewController: OldPortfolioManagerViewControllerProtocol?

    var data: [PortfolioItem] = []
    
    let parentId: UUID = UUID.zero
    
    var datastore = SummaryDataStore()

    required convenience init(parentId: UUID?) {
        self.init()

        self.navigationItem.title = CustomLocalization.Summary.summaryTitle

        self.interactor = self
        self.presenter = self
        self.viewController = self

        self.interactor?.presenter = self.presenter
        self.presenter?.viewController = self.viewController

        self.interactor?.loadData()

        self.customView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "portfolio")
        self.customView.tableView.dataSource = self
        self.customView.tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.datastore.update()
        self.customView.tableView.reloadData()
    }

}

extension SummaryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : tableView.estimatedSectionHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
}
