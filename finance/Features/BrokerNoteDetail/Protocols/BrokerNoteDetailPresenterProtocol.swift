//
//  BrokerNoteDetailPresenterProtocol.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 31/01/22.
//

import Foundation

protocol BrokerNoteDetailPresenterProtocol: AnyObject {
    var view: BrokerNoteDetailViewProtocol? { get }
    func loadData(note: BrokerNote)
}
