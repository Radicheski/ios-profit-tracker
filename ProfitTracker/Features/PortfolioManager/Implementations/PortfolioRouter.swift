//
//  PortfolioRouter.swift
//  finance
//
//  Created by Erik Radicheski da Silva on 21/01/22.
//

import UIKit

class PortfolioRouter: NSObject, PortfolioRouterProtocol {
    weak var view: PortfolioViewProtocol?

    func present(item: Portfolio.ViewModel) {
        let configurator = PortfolioConfigurator()
        let viewController = configurator.build(for: UUID(uuidString: item.id.value)!)
        viewController.title = item.name.value
        self.view?.navigationController?.pushViewController(viewController, animated: true)
    }

    func update(item: Portfolio.ViewModel) {
        let viewController = FormViewController()
        let name: Box<String?> = Box(item.name.value)
        let weight: Box<String?> = Box(item.weight.value)
        let asset: Box<Bool> = Box(!item.isAsset.value)
        let rows: [Row] = [
          TextInputFormField(key: "name",
                             value: name,
                             contentConfiguration: .init(title: PortfolioUpdateStrings.nameLabel.localizedString,
                                                         placeholder: name.value)),
          TextInputFormField(key: "weight",
                             value: weight,
                             contentConfiguration: .init(title: PortfolioUpdateStrings.weightLabel.localizedString,
                                                         placeholder: weight.value)),
          SwitchInputFormField(key: "asset",
                               value: asset,
                               contentConfiguration: .init(title: PortfolioUpdateStrings.portfolioLabel.localizedString,
                                                           value: asset.value))
        ]
        let section = TableViewSection(key: "updateHeader", rows: rows)

        viewController.dataSource.insert(section: section, at: 0)
        viewController.registerSections()

        let leftBarButton = UIBarButtonItem(systemItem: .cancel,
                                            primaryAction: UIAction(handler: self.action(_:)),
                                            menu: nil)
        viewController.navigationItem.leftBarButtonItem = leftBarButton

        let rightBarButton = UIBarButtonItem(systemItem: .save, primaryAction: UIAction(handler: { [weak self] _ in
            item.name.value = name.value
            item.weight.value = weight.value
            item.isAsset.value = !asset.value
            self?.view?.navigationController?.popViewController(animated: true)
        }))
        viewController.navigationItem.rightBarButtonItem = rightBarButton

        self.view?.show(viewController, sender: nil)
    }

    func action( _ action: UIAction) {
        self.view?.navigationController?.popViewController(animated: true)
    }

}
