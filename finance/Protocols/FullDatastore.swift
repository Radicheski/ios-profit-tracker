//
//  FullDatastore.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 20/01/22.
//

protocol FullDatastore: ReadOnlyDatastore {
    func newItem() -> Item
    func deleteItem(at index: Int)
    func moveItem(at startIndex: Int, to endIndex: Int)
    func saveChanges()
}
