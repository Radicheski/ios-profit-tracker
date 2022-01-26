//
//  ViewController.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 28/10/21.
//

import UIKit

class MainViewController: UITabBarController {

    let porftolioManager = PortfolioNavigationController()
    let summary = SummaryNavigationController()
    let transactions = TransactionNavigationController()
    let brokerNotes = BrokerNoteSummaryNavigationController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.viewControllers = [self.porftolioManager, self.summary, self.transactions, self.brokerNotes]
        self.view.backgroundColor = .systemBackground
    }

}





