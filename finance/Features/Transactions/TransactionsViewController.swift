//
//  TransactionsViewController.
//  finance
//
//  Created by Erik Radicheski da Silva on 15/01/22.
//

import UIKit

class TransactionsViewController: BaseViewController<PortfolioView> {
    
    var datastore = TransactionDataStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.customView.tableView.delegate = self
        self.customView.tableView.dataSource = self
        self.customView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "transaction")
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.navigationItem.title = CustomLocalization.Transactions.transactionTitle
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.customView.tableView.setEditing(editing, animated: animated)
        let sectionIndex = IndexSet(arrayLiteral: 0)
        if editing {
            self.customView.tableView.insertSections(sectionIndex, with: .left)
        } else {
            Persistence.shared.saveContext()
            self.customView.tableView.deleteSections(sectionIndex, with: .left)
        }
    }
    
}
