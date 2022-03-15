//
//  CoinTableViewCell.swift
//  Coin Alarm
//
//  Created by Владислав Семенец on 15.03.2022.
//

import UIKit

struct CryptoTableViewCellViewModel {
    let name: String
    let symbol: String
    let price: String
    let logoURL : String?
}

class CoinTableViewCell: UITableViewCell {

    static let identifier = "CoinTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        backgroundColor = .clear
        selectionStyle = .none
        addSubview(coinNameLabel)
        addSubview(coinSymbolLabel)
        addSubview(coinPriceLabel)
        addSubview(coinImageView)
    }
    
    let coinImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let coinNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Bitcoin"
        label.textColor = #colorLiteral(red: 0.631372549, green: 0.7019607843, blue: 0.7450980392, alpha: 1)
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let coinSymbolLabel: UILabel = {
        let label = UILabel()
        label.text = "BTC"
        label.textColor = #colorLiteral(red: 0.5723067522, green: 0.5723067522, blue: 0.5723067522, alpha: 1)
        label.alpha = 0.6
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let coinPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "39051"
        label.textColor = #colorLiteral(red: 0, green: 0.9810667634, blue: 0.5736914277, alpha: 1)
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            coinNameLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: 2),
            coinNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            coinNameLabel.heightAnchor.constraint(equalToConstant: 40),
            coinNameLabel.widthAnchor.constraint(equalToConstant: 150)
        ])
        NSLayoutConstraint.activate([
            coinSymbolLabel.leadingAnchor.constraint(equalTo: coinImageView.trailingAnchor, constant: 2),
            coinSymbolLabel.topAnchor.constraint(equalTo: coinNameLabel.bottomAnchor, constant: 2),
            coinSymbolLabel.heightAnchor.constraint(equalToConstant: 20),
            coinSymbolLabel.widthAnchor.constraint(equalToConstant: 90)
        ])
        NSLayoutConstraint.activate([
            coinPriceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            coinPriceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            coinPriceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 2),
//            coinPriceLabel.widthAnchor.constraint(equalToConstant: 400)
        ])
        NSLayoutConstraint.activate([
            coinImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            coinImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            coinImageView.heightAnchor.constraint(equalToConstant: 60),
            coinImageView.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    func configure(with viewModel: CryptoTableViewCellViewModel) {
        coinNameLabel.text = viewModel.name
        coinSymbolLabel.text = viewModel.symbol
        coinPriceLabel.text = viewModel.price
        let url = URL(string: "https://cryptoicons.org/api/icon/\(viewModel.symbol.lowercased())/60")
        DispatchQueue.main.async {
            if let data = try? Data(contentsOf: url!)
            {
                self.coinImageView.image = UIImage(data: data)
                print(viewModel.logoURL)
            }
        }
    }
}
