//
//  PortfolioViewController.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 28/10/21.
//

import UIKit

class PortfolioViewController: BaseViewController<PortfolioView> {

    var interactor: PortfolioManagerInteractorProtocol?
    var presenter: PortfolioManagerPresenterProtocol? = PortfolioManagerDataSource()
    var viewController: PortfolioManagerViewControllerProtocol? {
        get {
            return self
        }
        set {}
    }

    var dataSource: UITableViewDataSource? {
        get {
            return self.presenter as? UITableViewDataSource
        }
    }

    var parentId: UUID?

    var data: [PortfolioItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.customView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "portfolioItem")
        if self.navigationItem.title == nil { self.navigationItem.title = CustomLocalization.PortfolioManager.globalPortfolioTitle }
        self.customView.tableView.dataSource = self.dataSource
        self.customView.tableView.delegate = self
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if let view = self.view as? PortfolioView {
            view.tableView.setEditing(editing, animated: animated)
            if editing {
                let indexPath = IndexPath(row: 0, section: 1)
                view.tableView.insertRows(at: [indexPath], with: .automatic)
                view.tableView.scrollToBottom(at: .none, animated: true)
            } else {
                Persistence.shared.saveContext()
                view.tableView.deleteRows(at: [IndexPath(row: 0, section: 1)], with: .automatic)
            }
        }
    }
    
    convenience init(parentId: UUID?) {
        self.init()
        self.parentId = parentId
        
        self.interactor = PortfolioInteractor(parentId: parentId)

        self.interactor?.presenter = self.presenter
        self.presenter?.viewController = self
        (self.presenter as? PortfolioManagerDataSource)?.interactor = self.interactor

        self.interactor?.loadData()
    }
    
}
