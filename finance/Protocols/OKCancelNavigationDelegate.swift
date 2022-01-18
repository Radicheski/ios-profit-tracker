//
//  OKCancelNavigationDelegate.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 18/01/22.
//

import UIKit

protocol OKCancelNavigationDelegate: AnyObject {
    func buttonPressed(_ button: UIBarButtonItem, event: UIBarButtonItem.SystemItem)
}
