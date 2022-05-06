//
//  NavigationManager.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 18/01/22.
//

import UIKit

class NavigationManager {

    private class Weak<T: UIView> {
        weak var weakObject: T?
        init(_ weakObject: T) {
            self.weakObject = weakObject
        }
    }

    private var currentTag: Int = 0

    private var sequence: [Weak<UIView>] = []

    func addView(_ view: UIView) {
        self.sequence.append(Weak(view))
        self.updateTags()
    }

    private func removeNil() {
        self.sequence = self.sequence.filter { $0.weakObject != nil }
    }

    private func updateTags() {
        self.removeNil()
        for index in 0 ..< self.sequence.count {
            self.sequence[index].weakObject?.tag = index
        }
    }

    func navigateToNext() {
        self.currentTag += 1
        if self.currentTag >= self.sequence.count { self.currentTag = 0 }
        self.sequence[self.currentTag].weakObject?.becomeFirstResponder()
    }

    func navigateToPrevious() {
        self.currentTag -= 1
        if self.currentTag < 0 { self.currentTag = self.sequence.count - 1 }
        self.sequence[self.currentTag].weakObject?.becomeFirstResponder()
    }

    func resignFirstResponder() {
        self.sequence[self.currentTag].weakObject?.resignFirstResponder()
    }

}
