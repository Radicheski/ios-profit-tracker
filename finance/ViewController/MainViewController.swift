//
//  ViewController.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 28/10/21.
//

import UIKit

class MainViewController: UITabBarController {

    let porftolioManager = PortfolioNavigationController()
    let summary = SummaryNavigationController(rootViewController: SummaryViewController(parentId: nil))
    let transactions: UINavigationController = {
        let viewController = UINavigationController(rootViewController: TransactionsViewController())
        viewController.tabBarItem.title = CustomLocalization.Transactions.transactionsTabBarTitle
        viewController.tabBarItem.image = UIImage(systemName: "banknote")
        return viewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.viewControllers = [self.porftolioManager, self.summary, self.transactions]
        self.view.backgroundColor = .systemBackground
    }

}





