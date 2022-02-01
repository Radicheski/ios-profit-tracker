//
//  BrokerNoteDetailViewController.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 31/01/22.
//

import Foundation

class BrokerNoteDetailViewController: FormViewController, BrokerNoteDetailViewProtocol {
    
    var interactor: BrokerNoteDetailInteractorProtocol
    var router: BrokerNoteDetailRouterProtocol
    
    init(interactor: BrokerNoteDetailInteractorProtocol, router: BrokerNoteDetailRouterProtocol) {
        self.interactor = interactor
        self.router = router
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func loadData() {
        self.interactor.loadData()
    }
    
    func presentData(item: [Section]) {
        self.dataSource.setSections(item)
        self.dataSource.register(in: self.customView.tableView)
        self.customView.tableView.reloadData()
    }
    
}
