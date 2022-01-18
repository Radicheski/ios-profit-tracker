//
//  OKCancelNavigationBar.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 18/01/22.
//

import UIKit

class OKCancelNavigationBar: UINavigationBar {
    
    let navigationItem = UINavigationItem()
    let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(buttonPressed(_:)))
    let doneButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(buttonPressed(_:)))
    
    weak var okCancelDelegate: OKCancelNavigationDelegate?
    
    init() {
        super.init(frame: .zero)
        
        self.navigationItem.rightBarButtonItem = doneButton
        self.navigationItem.leftBarButtonItem = cancelButton
        self.pushItem(navigationItem, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc func buttonPressed(_ button: UIBarButtonItem) {
        let event: UIBarButtonItem.SystemItem
        switch button {
        case self.cancelButton: event = .cancel
        case self.doneButton: event = .done
        default: return
        }
        self.okCancelDelegate?.buttonPressed(button, event: event)
    }
    
}
