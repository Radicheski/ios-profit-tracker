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

    var parentId: UUID = UUID.zero

    var data: [PortfolioItem] = []
    
    override func viewDidLoad() {
        self.setupVipCycle()
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.customView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "portfolioItem")
        if self.navigationItem.title == nil { self.navigationItem.title = CustomLocalization.PortfolioManager.globalPortfolioTitle }
        self.customView.tableView.dataSource = self.dataSource
        self.customView.tableView.delegate = self
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.customView.tableView.setEditing(editing, animated: animated)
        let indexPath = IndexPath(row: 0, section: 1)
        if editing {
            self.customView.tableView.insertRows(at: [indexPath], with: .left)
            self.customView.tableView.scrollToBottom(at: .none, animated: true)
        } else {
            Persistence.shared.saveContext()
            self.customView.tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(parentId: UUID) {
        self.init()
        self.parentId = parentId
    }
    
    func setupVipCycle() {
        self.interactor = PortfolioInteractor(parentId: parentId)

        self.interactor?.presenter = self.presenter
        self.presenter?.viewController = self
        (self.presenter as? PortfolioManagerDataSource)?.interactor = self.interactor

        self.interactor?.loadData()
    }
    
    required init?(coder: NSCoder) {
        self.parentId = UUID.zero
        super.init(coder: coder)
    }
    
}
