//
//  UpdateViewController.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 04/01/22.
//

import UIKit

class UpdateViewController: BaseViewController<UpdateView> {
    
    var item: PortfolioItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.customView.nameTextField.text = item?.name
        self.customView.weightTextField.text = Formatter.shared.percent.string(from: item?.weight ?? Decimal())
        self.customView.parentTextField.text = item?.parentId?.description
        self.customView.assetSwitch.isOn = !(item?.asset ?? false)
        self.customView.assetSwitch.addTarget(self, action: #selector(switchFunc), for: .valueChanged)
        
        self.customView.nameTextField.delegate = self
        self.customView.weightTextField.delegate = self
        self.customView.parentTextField.delegate = self
    }
    
    @objc func switchFunc() {
        self.item?.asset = !self.customView.assetSwitch.isOn
    }
    
}
