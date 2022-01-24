//
//  TransactionViewController.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 23/01/22.
//

import Foundation
import UIKit

class TransactionViewController: BaseViewController<PortfolioView>, TransactionViewProtocol {
    
    var interactor: TransactionInteractorProtocol
    var router: TransactionRouterProtocol
    
    var datasource: TransactionTableViewDataSource?
    var delegate: TransactionTableViewDelegate?
    
    init(interactor: TransactionInteractorProtocol, router: TransactionRouterProtocol) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
        
        self.datasource = TransactionTableViewDataSource()
        self.datasource?.viewController = self
        self.customView.tableView.dataSource = self.datasource
        
        self.delegate = TransactionTableViewDelegate()
        self.delegate?.viewController = self
        self.customView.tableView.delegate = self.delegate
        
        self.customView.tableView.register(UITableViewCell.self)
        self.customView.tableView.allowsSelectionDuringEditing = true
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        if self.navigationItem.title == nil { self.navigationItem.title = CustomLocalization.Transactions.transactionTitle }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        self.customView.tableView.setEditing(editing, animated: animated)
        super.setEditing(editing, animated: animated)
        let sectionIndex = IndexSet(arrayLiteral: 0)
        if editing {
            self.navigationItem.setLeftBarButton(UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelEdit)), animated: true)
            self.customView.tableView.insertSections(sectionIndex, with: .left)
        } else {
            self.navigationItem.setLeftBarButton(nil, animated: true)
            self.interactor.save()
            self.customView.tableView.deleteSections(sectionIndex, with: .left)
        }
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
    
    func present(fromIndex index: Int) {
        self.interactor.present(fromIndex: index)
    }
    
    func present(item: Transaction.ViewModel) {
        self.router.present(item: item)
    }
    
    func present(_ viewController: UIViewController) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    func insert() {
        self.interactor.insert()
    }
    
    func delete(fromIndex index: Int) {
        self.interactor.delete(fromIndex: index)
    }
    
    func updateView(_ items: [Transaction.ViewModel]) {
        self.datasource?.data = items
        let sections = IndexSet(0..<self.customView.tableView.numberOfSections)
        self.customView.tableView.reloadSections(sections, with: .automatic)
    }
    
}
