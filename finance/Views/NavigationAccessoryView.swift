//
//  UpdateKeyboardAccessoryView.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 18/01/22.
//

import UIKit

class NavigationAccessoryView: UIToolbar {

    enum Event {
        case previous
        case next
        case done
    }

    lazy var previousButton = UIBarButtonItem(image: UIImage(systemName: "chevron.up"),
                                        style: .plain,
                                        target: self,
                                        action: #selector(buttonTapped(_:)))
    lazy var nextButton = UIBarButtonItem(image: UIImage(systemName: "chevron.down"),
                                          style: .plain,
                                          target: self,
                                          action: #selector(buttonTapped(_:)))

    var space = UIBarButtonItem(systemItem: .flexibleSpace, primaryAction: nil, menu: nil)

    lazy var doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(buttonTapped(_:)))

    weak var navigationDelegate: NavigationAccessoryDelegate?

    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))

        self.setItems([self.previousButton, self.nextButton, self.space, self.doneButton], animated: true)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    @objc func buttonTapped(_ button: UIBarButtonItem) {
        let event: Event
        switch button {
        case self.previousButton: event = .previous
        case self.nextButton: event = .next
        case self.doneButton: event = .done
        default: return
        }
        self.navigationDelegate?.buttonTapped(button, event: event)
    }

}
