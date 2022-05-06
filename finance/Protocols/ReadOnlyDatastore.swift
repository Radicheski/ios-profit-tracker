//
//  ReadDatastore.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 20/01/22.
//

protocol ReadOnlyDatastore {
    associatedtype T

    var data: [T] { get }
    var count: Int { get }

    func update()
}
