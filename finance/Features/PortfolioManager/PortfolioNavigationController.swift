//
//  PortfolioNavigationController.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 28/10/21.
//

import UIKit

class PortfolioNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarItem.title = "Portfolio"
        self.tabBarItem.image = UIImage(systemName: "globe")
    }


}

