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
    }
    
    
    
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
//        button.translatesAutoresizingMaskIntoConstraints = false
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
//        NSLayoutConstraint.activate([
//            goAlarmView.topAnchor.constraint(equalTo: view.topAnchor, constant: 1000),
//            goAlarmView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
//            goAlarmView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
//            goAlarmView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 40)
//        ])
//        NSLayoutConstraint.activate([
//            alarmButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
//            alarmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            alarmButton.heightAnchor.constraint(equalToConstant: 45),
//            alarmButton.widthAnchor.constraint(equalToConstant: 100)
//        ])
    }
}
