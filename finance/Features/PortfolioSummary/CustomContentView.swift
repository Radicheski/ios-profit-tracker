//
// Created by Erik Radicheski da Silva on 05/11/21.
//

import UIKit

class CustomContentView: UIView, UIContentView {


    var titleLabel = UILabel()
    var weightLabel = UILabel()
    var priceLabel = UILabel()

    var configuration: UIContentConfiguration {
        didSet {
            self.configure()
        }
    }

    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)

        [self.titleLabel, self.weightLabel, self.priceLabel].forEach( { $0.translatesAutoresizingMaskIntoConstraints = false } )
        [self.titleLabel, self.weightLabel, self.priceLabel].forEach( { self.addSubview($0) } )
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 11),
            self.titleLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 20),
            self.priceLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 11),
            self.priceLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -20),
            self.weightLabel.topAnchor.constraint(equalTo: self.priceLabel.safeAreaLayoutGuide.bottomAnchor, constant: 3),
            self.weightLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -20),
            self.weightLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -11),
        ])
        self.titleLabel.font = UIFont.systemFont(ofSize: 17)
        self.priceLabel.font = UIFont.systemFont(ofSize: 17)
        self.weightLabel.font = UIFont.systemFont(ofSize: 12)

        self.configure()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure() {
        if let conf = self.configuration as? CustomContentConfiguration {
            self.titleLabel.text = conf.title
            if let weight = conf.weight {
                self.weightLabel.text = Formatter.shared.percent.string(from: weight)
            }
            self.priceLabel.text = "<N/D>"
            self.priceLabel.textColor = .secondaryLabel
            if let title = conf.title {
                let worker = NetworkWorker(ticker: title)
                worker.getQuote { (quote: [Quote]) in
                    let price = quote[0].vl_fechamento
                    DispatchQueue.main.async { [weak self] in
                        self?.priceLabel.text = Formatter.shared.currency.string(from: price)
                        self?.priceLabel.textColor = .black
                    }
                } onError: { error in
                    #warning("Improve error handling")
                    print(error)
                }
            }
        }
    }

}
