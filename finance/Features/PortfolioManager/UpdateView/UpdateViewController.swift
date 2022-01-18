//
//  UpdateViewController.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 04/01/22.
//

import UIKit

class UpdateViewController: BaseViewController<UpdateView> {
    
    var item: PortfolioItem? {
        didSet { self.updateView() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.customView.nameTextField.delegate = self
        self.customView.weightTextField.delegate = self
        self.customView.parentTextField.delegate = self
        
        self.customView.navigationBar.saveCancelDelegate = self
    }
    
    func updateView() {
        if let item = item {
            self.customView.nameTextField.placeholder = item.name
            self.customView.weightTextField.placeholder = Formatter.shared.percent.string(from: item.weight)
            self.customView.parentTextField.placeholder = item.parentId?.description
            self.customView.assetSwitch.isOn = !(item.asset)
        }
    }
    
}
