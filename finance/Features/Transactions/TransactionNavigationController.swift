//
//  TransactionNavigationController.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 23/01/22.
//

import UIKit

class TransactionNavigationController: UINavigationController {
    
    convenience init() {
        let configurator = TransactionConfigurator()
        let viewController = configurator.build()
        self.init(rootViewController: viewController)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarItem.title = CustomLocalization.Transactions.transactionsTabBarTitle
        self.tabBarItem.image = UIImage(systemName: "banknote")
    }

}
