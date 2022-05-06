//
//  BokerNoteSummaryNavigationController.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 25/01/22.
//

import UIKit

class BrokerNoteSummaryNavigationController: UINavigationController {

    convenience init() {
        let configurator = BrokerNoteSummaryConfigurator()
        let viewController = configurator.build()
        self.init(rootViewController: viewController)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarItem.title = CustomLocalization.BrokerNotes.brokerNotesTabBarTitle
        self.tabBarItem.image = UIImage(systemName: "banknote")
    }

}
