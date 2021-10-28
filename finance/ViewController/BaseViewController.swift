//
//  BaseViewController.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 28/10/21.
//

import UIKit

class BaseViewController<T: UIView>: UIViewController {
    
    var customView: T {
        get {
            return self.view as! T
        }
    }
    
    
    override func loadView() {
        self.view = T()
    }
    
    
}

