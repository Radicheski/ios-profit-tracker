//
// Created by Erik Radicheski da Silva on 05/11/21.
//

import UIKit

class CustomContentView: UIView, UIContentView {

    var titleLabel = UILabel()
    var weightLabel = UILabel()
    var priceLabel = UILabel()
    var quantityLabel = UILabel()

    var configuration: UIContentConfiguration {
        didSet {
            self.configure()
        }
    }

    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)

        [self.titleLabel, self.weightLabel, self.priceLabel, self.quantityLabel].forEach( { $0.translatesAutoresizingMaskIntoConstraints = false } )
        [self.titleLabel, self.weightLabel, self.priceLabel, self.quantityLabel].forEach( { self.addSubview($0) } )
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 11),
            self.titleLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 20),
            self.priceLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 11),
            self.priceLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -20),
            self.weightLabel.topAnchor.constraint(equalTo: self.priceLabel.safeAreaLayoutGuide.bottomAnchor, constant: 3),
            self.weightLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -20),
            self.weightLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -11),
            self.quantityLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            self.quantityLabel.centerYAnchor.constraint(equalTo: self.titleLabel.centerYAnchor),
        ])
        self.titleLabel.font = UIFont.systemFont(ofSize: 17)
        self.priceLabel.font = UIFont.systemFont(ofSize: 17)
        self.weightLabel.font = UIFont.systemFont(ofSize: 12)
        self.quantityLabel.font = UIFont.systemFont(ofSize: 17)

        self.configure()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure() {
        if let conf = self.configuration as? CustomContentConfiguration {
            self.titleLabel.text = conf.title
            self.weightLabel.text = conf.weight
            self.quantityLabel.text = conf.quantity
            self.priceLabel.text = conf.price
            self.priceLabel.textColor = .secondaryLabel
        }
    }

}
