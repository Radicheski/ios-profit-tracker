//
//  PortfolioViewController.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 21/01/22.
//

import UIKit

class PortfolioViewController: BaseViewController<PortfolioView>, PortfolioViewProtocol {

    var interactor: PortfolioInteractorProtocol
    var router: PortfolioRouterProtocol
    var delegate: PortfolioTableViewDelegate? {
        didSet {
            self.customView.tableView.delegate = self.delegate
        }
    }
    var datasource: PortfolioTableViewDataSource? {
        didSet {
            self.customView.tableView.dataSource = self.datasource
        }
    }

    init(interactor: PortfolioInteractorProtocol, router: PortfolioRouterProtocol) {

        self.interactor = interactor
        self.router = router

        super.init(nibName: nil, bundle: nil)

        self.customView.tableView.register(UITableViewCell.self)
        self.delegate = PortfolioTableViewDelegate()
        self.datasource = PortfolioTableViewDataSource()
        self.delegate?.viewController = self
        self.datasource?.viewController = self
        self.customView.tableView.delegate = self.delegate
        self.customView.tableView.dataSource = self.datasource

        self.navigationItem.rightBarButtonItem = self.editButtonItem
        if self.navigationItem.title == nil {
            self.navigationItem.title = PortfolioManagerStrings.globalPortfolioTitle.localizedString
        }

        self.customView.tableView.allowsSelectionDuringEditing = true
    }

    override func viewWillAppear(_ animated: Bool) {
        self.loadData()
        super.viewWillAppear(animated)
    }

    func loadData() {
        self.interactor.loadData()
    }

    override func setEditing(_ editing: Bool, animated: Bool) {
        self.customView.tableView.setEditing(editing, animated: animated)
        super.setEditing(editing, animated: animated)
        let indexPath = IndexPath(row: 0, section: 1)
        if editing {
            let leftBarButton = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                target: self,
                                                action: #selector(cancelEdit))
            self.navigationItem.setLeftBarButton(leftBarButton, animated: true)
            self.customView.tableView.insertRows(at: [indexPath], with: .left)
            self.customView.tableView.scrollToBottom(at: .none, animated: true)
        } else {
            self.navigationItem.setLeftBarButton(nil, animated: true)
            self.interactor.save()
            self.customView.tableView.deleteRows(at: [indexPath], with: .left)
        }
    }

    @objc func cancelEdit() {
        self.interactor.discard()
        self.setEditing(false, animated: true)
    }

    required init?(coder: NSCoder) {
        return nil
    }

    func updateView(with data: [Portfolio.ViewModel]) {
        self.datasource?.data = data
        let sections = IndexSet(0..<self.customView.tableView.numberOfSections)
        self.customView.tableView.reloadSections(sections, with: .automatic)
    }

    func present(fromIndex index: Int) {
        self.interactor.present(fromIndex: index)
    }

    func present(item: Portfolio.ViewModel) {
        if isEditing {
            self.router.update(item: item)
        } else {
            self.router.present(item: item)
        }
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

    func move(from startIndex: Int, to endIndex: Int) {
        self.interactor.move(from: startIndex, to: endIndex)
    }

    func askForConfirmation(_ completion: ((Bool) -> Void)?) {

        let alert = UIAlertController(title: nil,
                                      message: PortfolioManagerStrings.globalPortfolioDeleteMessage.localizedString,
                                      preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: CommonStrings.cancelText.localizedString,
                                         style: .cancel,
                                         handler: { _ in completion?(false)})
        alert.addAction(cancelAction)

        let okAction = UIAlertAction(title: CommonStrings.okText.localizedString,
                                     style: .destructive,
                                     handler: { _ in completion?(true)})
        alert.addAction(okAction)

        self.present(alert, animated: true)
    }

}
