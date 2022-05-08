//
//  PortfolioNavigationController.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 28/10/21.
//

import UIKit

class PortfolioNavigationController: UINavigationController {

    convenience init() {
        let configurator = PortfolioConfigurator()
        let viewController = configurator.build(for: UUID.zero)
        self.init(rootViewController: viewController)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarItem.title = PortfolioManagerStrings.tabBarTitle.localizedString
        self.tabBarItem.image = UIImage(systemName: "globe")
    }

}
