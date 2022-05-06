//
//  SummaryDataStore.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 20/01/22.
//

class SummaryDataStore: ReadOnlyDatastore {
    typealias T = SummaryItem

    private var portfolioDatastore = PortfolioDatastore.shared
    private var transactionDatastore = TransactionDataStore()

    private(set) var data: [SummaryItem] = []

    init() {
        self.update()
    }

    var count: Int {
        get { return self.data.count }
    }

    func update() {
        var data: [String: SummaryItem] = [:]

        let portfolioItems = Portfolio.getItems(PortfolioDatastore.shared.getTree(for: nil))

        for item in portfolioItems {
            let summary = data[item.name, default: SummaryItem(name: item.name)]
            summary.weight = item.weight
            data[item.name] = summary
        }

        let transactions = self.transactionDatastore.data

        for item in transactions {
            let summary = data[item.ticker, default: SummaryItem(name: item.ticker)]
            summary.quantity += item.quantity
            data[item.ticker] = summary
        }

        self.data = data.filter { $0.value.quantity != 0 || !$0.value.weight.isZero }.map { $0.value }.sorted { $0.name < $1.name }

    }

}
