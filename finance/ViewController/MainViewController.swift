//
//  ViewController.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 28/10/21.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.addChild(PortfolioNavigationController())
        self.addChild(FlatPortfolioViewController(parentId: nil))
        self.view.backgroundColor = .white
    }


}





