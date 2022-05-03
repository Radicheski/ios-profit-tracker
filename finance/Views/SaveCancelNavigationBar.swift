//
//  OKCancelNavigationBar.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 18/01/22.
//

import UIKit

class SaveCancelNavigationBar: UINavigationBar {
    
    enum Event {
        case save
        case cancel
    }
    
    let navigationItem = UINavigationItem()
    lazy var cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(buttonPressed(_:)))
    lazy var saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(buttonPressed(_:)))
    
    weak var saveCancelDelegate: SaveCancelNavigationDelegate?
    
    init() {
        super.init(frame: .zero)
        
        self.navigationItem.rightBarButtonItem = saveButton
        self.navigationItem.leftBarButtonItem = cancelButton
        self.pushItem(navigationItem, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc func buttonPressed(_ button: UIBarButtonItem) {
        let event: Event
        switch button {
        case self.cancelButton: event = .cancel
        case self.saveButton: event = .save
        default: return
        }
        self.saveCancelDelegate?.buttonPressed(button, event: event)
    }
    
}
