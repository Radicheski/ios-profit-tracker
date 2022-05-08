//
//  BrokerNoteSummaryWorker.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 25/01/22.
//

import Foundation

class BrokerNoteSummaryWorker: BrokerNoteSummaryWorkerProtocol {

    var context = Persistence.shared.context

    func loadData() -> [BrokerNote] {
        do {
            let request = BrokerNote.createFetchRequest()
            request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
            let response = try self.context.fetch(request)
            return response
        } catch {
            return []
        }
    }

    func save() {
        if self.context.hasChanges { try? self.context.save() }
    }

    func discard() {
        if self.context.hasChanges { self.context.rollback() }
    }

    func insert() {
        let newItem = BrokerNote(context: self.context)
        newItem.id = UUID()
        newItem.date = Date.now
        newItem.noteNumber = 0
        newItem.brokerageHouse = ""
    }

    func present(fromIndex index: Int) -> BrokerNote {
        let data = self.loadData()
        return data[index]
    }

    func delete(fromIndex index: Int) {
        var data = self.loadData()
        let item = data.remove(at: index)
        self.context.delete(item)
    }

}
