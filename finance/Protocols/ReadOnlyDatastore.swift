//
//  ReadDatastore.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 20/01/22.
//

protocol ReadOnlyDatastore {
    associatedtype Item

    var data: [Item] { get }
    var count: Int { get }

    func update()
}
