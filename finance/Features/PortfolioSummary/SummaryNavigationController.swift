//
// Created by Erik Radicheski da Silva on 04/11/21.
//

import UIKit

class SummaryNavigationController: UINavigationController {

    convenience init() {
        let configurator = SummaryConfigurator()
        let viewController = configurator.build()
        self.init(rootViewController: viewController)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarItem.title = SummaryStrings.summaryTabBarTitle.localizedString
        self.tabBarItem.image = UIImage(systemName: "person")
    }

}
