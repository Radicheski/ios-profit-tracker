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
        var name: Box<String?> = Box(item.name.value)
        var weight: Box<String?> = Box(item.weight.value)
        var asset: Box<Bool> = Box(!item.isAsset.value)
        viewController.data = [
            TextInputFormField(key: "name", value: name, contentConfiguration: .init(title: CustomLocalization.UpdateView.updateViewNameLabel, placeholder: name.value)),
            TextInputFormField(key: "weight", value: weight, contentConfiguration: .init(title: CustomLocalization.UpdateView.updateViewWeightLabel, placeholder: weight.value)),
            SwitchInputFormField(key: "asset", value: asset, contentConfiguration: .init(title: CustomLocalization.UpdateView.updateViewPortfolioLabel, value: asset.value))
        ]
        
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(systemItem: .cancel, primaryAction: UIAction(handler: self.action(_:)), menu: nil)
        
        viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .save, primaryAction: UIAction(handler: { [weak self] _ in
            item.name.value = name.value
            item.weight.value = weight.value
            item.isAsset.value = !asset.value
            self?.view?.navigationController?.popViewController(animated: true)
        }))
        
        self.view?.show(viewController, sender: nil)
    }

    func action( _ action: UIAction) {
        self.view?.navigationController?.popViewController(animated: true)
    }
    
}
