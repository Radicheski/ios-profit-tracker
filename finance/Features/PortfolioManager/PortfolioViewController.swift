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
        self.interactor?.fetchTotalAllocated()
    }
    
}

extension PortfolioViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 { return }
            
        if let dataSource = self.presenter as? PortfolioManagerDataSource {
            let selectedItem = dataSource.data[indexPath.row]
            let vc = PortfolioViewController(parentId: selectedItem.id)
            vc.navigationItem.title = selectedItem.name
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.section == 0 {
            return .delete
        } else if indexPath.row == 0 {
            return .insert
        } else {
            return .none
        }
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        if indexPath.section == 1 { return }
        
        if let item = self.interactor?.getItem(at: indexPath.row) {
            let vc = UpdateViewController()
            vc.item = item
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        return proposedDestinationIndexPath.section == 0 ? proposedDestinationIndexPath : sourceIndexPath
    }
    
}

extension PortfolioViewController: PortfolioManagerViewControllerProtocol {

    func updateView() {
        DispatchQueue.main.async { self.customView.tableView.reloadData() }
    }

    func updateTotalAllocated(value: Decimal) {
        let localizedString = CustomLocalization.PortfolioManager.globalPortfolioUnallocated
        let percentValue = Formatter.shared.percent.string(from: 100 - value * 100) ?? ""
        self.customView.footerText = String.localizedStringWithFormat(localizedString, percentValue as CVarArg)
    }

}
