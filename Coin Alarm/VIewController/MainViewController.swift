//
//  MainViewController.swift
//  Coin Alarm
//
//  Created by Владислав Семенец on 15.03.2022.
//

import UIKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
        goAlarmView.frame = CGRect(x: 0,
                                   y: 1000,
                                   width: view.frame.width,
                                   height: 600)
        alarmButton.frame = CGRect(x: 155,
                                   y: 1000,
                                   width: 100,
                                   height: 45)
        coinTableView.register(CoinTableViewCell.self, forCellReuseIdentifier: idCoinTableViewCell)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1) {
            self.goAlarmView.frame = CGRect(x: 0,
                                            y: 700,
                                            width: self.view.frame.width,
                                            height: 600)
            self.alarmButton.frame = CGRect(x: 155,
                                           y: 800,
                                           width: 100,
                                           height: 45)
            
        }
    }
    
    private func setupView(){
        view.addSubview(spaceBackground)
        view.addSubview(goAlarmView)
        view.addSubview(alarmButton)
        view.addSubview(coinTableView)
        coinTableView.delegate = self
        coinTableView.dataSource = self
        NomicsAPICaller.shared.getAllCyproData{ [weak self]result in
            switch result{
            case .success(let models):
                self?.viewModels = models.compactMap({CryptoTableViewCellViewModel(
                    name: $0.name ?? "",
                    symbol: $0.symbol ?? "",
                    price: $0.price ?? "",
                    logoURL: $0.logoURL ?? "")
                })
            
                DispatchQueue.main.async {
                    self?.coinTableView.reloadData()
                }
                
            case .failure(_):
                print("error")
            }
        }
        view.addSubview(updateButton)
    }
    
    private let updateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "repeat.circle"), for: .normal)
        button.tintColor = #colorLiteral(red: 0.1294117647, green: 0.2196078431, blue: 0.2431372549, alpha: 1)
        button.backgroundColor = #colorLiteral(red: 0.631372549, green: 0.7019607843, blue: 0.7450980392, alpha: 1)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(updateTableView), for: .touchUpInside)
        return button
    }()
    
    private let coinTableViewCell = CoinTableViewCell()
    
    @objc private func updateTableView() {
        NomicsAPICaller.shared.getAllCyproData{ [weak self]result in
            switch result{
            case .success(let models):
                self?.viewModels = models.compactMap({CryptoTableViewCellViewModel(
                    name: $0.name ?? "",
                    symbol: $0.symbol ?? "",
                    price: $0.price ?? "",
                    logoURL: $0.logoURL ?? "")
                })
            
                DispatchQueue.main.async {
                    self?.coinTableView.reloadData()
                }
                
            case .failure(_):
                print("error")
            }
        }
    }
    
    private var viewModels = [CryptoTableViewCellViewModel]()
    
    private let coinTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delaysContentTouches = false
        return tableView
    }()
    
    private let idCoinTableViewCell = "idCoinTableViewCell"
    private let goAlarmView = GoAlarmView()
    private let alarmVC = AlarmViewController()
    
    private let spaceBackground: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "space")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let alarmButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ALARM", for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = #colorLiteral(red: 0.631372549, green: 0.7019607843, blue: 0.7450980392, alpha: 1)
        button.tintColor = #colorLiteral(red: 0.4980392157, green: 0.2470588235, blue: 0.07450980392, alpha: 1)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.font = .boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(alarmScreen), for: .touchUpInside)
        return button
    }()
    
    @objc private func alarmScreen() {
        alarmVC.modalPresentationStyle = .fullScreen
        present(alarmVC, animated: true)
    }
    
    
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            spaceBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            spaceBackground.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            spaceBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            spaceBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            coinTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            coinTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            coinTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            coinTableView.bottomAnchor.constraint(equalTo: goAlarmView.topAnchor, constant: -40)
        ])
        NSLayoutConstraint.activate([
            updateButton.topAnchor.constraint(equalTo: coinTableView.bottomAnchor, constant: 0),
            updateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            updateButton.heightAnchor.constraint(equalToConstant: 40),
            updateButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
}

extension MainViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idCoinTableViewCell, for: indexPath) as? CoinTableViewCell else {
            fatalError()
        }
        cell.configure(with: viewModels[indexPath.row])
        return cell 
    }
    
    
}
