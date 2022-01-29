//
//  Box.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 22/01/22.
//

class Box<T> {
    
    var listener: ((T) -> Void)?
    
    var value: T {
        didSet { self.listener?(self.value) }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
}
