//
// Created by Erik Radicheski da Silva on 04/11/21.
//

import UIKit

class SummaryNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarItem.title = CustomLocalization.Summary.summaryTabBarTitle
        self.tabBarItem.image = UIImage(systemName: "person")
    }

}
