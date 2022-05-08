//
//  OKCancelNavigationDelegate.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 18/01/22.
//

import UIKit

protocol SaveCancelNavigationDelegate: AnyObject {
    func buttonPressed(_ button: UIBarButtonItem, event: SaveCancelNavigationBar.Event)
}
