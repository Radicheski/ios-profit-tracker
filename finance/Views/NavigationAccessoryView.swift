//
//  UpdateKeyboardAccessoryView.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 18/01/22.
//

import UIKit

class NavigationAccessoryView: UIToolbar {

    enum Event {
        case up
        case down
        case done
    }

    lazy var upButton = UIBarButtonItem(image: UIImage(systemName: "chevron.up"), style: .plain, target: self, action: #selector(buttonTapped(_:)))
    lazy var downButton = UIBarButtonItem(image: UIImage(systemName: "chevron.down"), style: .plain, target: self, action: #selector(buttonTapped(_:)))

    var space = UIBarButtonItem(systemItem: .flexibleSpace, primaryAction: nil, menu: nil)

    lazy var doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(buttonTapped(_:)))

    weak var navigationDelegate: NavigationAccessoryDelegate?

    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))

        self.setItems([self.upButton, self.downButton, self.space, self.doneButton], animated: true)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    @objc func buttonTapped(_ button: UIBarButtonItem) {
        let event: Event
        switch button {
        case self.upButton: event = .up
        case self.downButton: event = .down
        case self.doneButton: event = .done
        default: return
        }
        self.navigationDelegate?.buttonTapped(button, event: event)
    }

}
