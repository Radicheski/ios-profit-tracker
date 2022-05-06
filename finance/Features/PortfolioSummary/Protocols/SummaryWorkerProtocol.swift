//
//  SummaryWorkerProtocol.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 22/01/22.
//

protocol SummaryWorkerProtocol: AnyObject {
    func loadData() -> [SummaryItem]
}
