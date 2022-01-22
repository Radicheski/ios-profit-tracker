//
//  SummaryInteractorProtocol.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 22/01/22.
//

protocol SummaryInteractorProtocol: AnyObject {
    var presenter: SummaryPresenterProtocol { get }
    var worker: SummaryWorkerProtocol { get }
}
