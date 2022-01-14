//
//  ViewController.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 28/10/21.
//

import UIKit

class MainViewController: UITabBarController {

    let porftolioManager = PortfolioNavigationController(rootViewController: PortfolioViewController(parentId: nil))
    let summary = SummaryNavigationController(rootViewController: FlatPortfolioViewController(parentId: nil))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        self.viewControllers = [self.porftolioManager, self.summary]
        self.view.backgroundColor = .systemBackground
    }

}





