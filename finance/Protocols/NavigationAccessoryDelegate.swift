//
//  AccessoryDelegate.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 18/01/22.
//

import UIKit

protocol NavigationAccessoryDelegate: AnyObject {
    func buttonTapped(_ button: UIBarButtonItem, event: NavigationAccessoryView.Event)
}
