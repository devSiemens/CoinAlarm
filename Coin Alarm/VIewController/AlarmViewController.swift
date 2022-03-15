//
//  AlarmViewController.swift
//  Coin Alarm
//
//  Created by Владислав Семенец on 15.03.2022.
//

import UIKit
class AlarmViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
    }
    
    private func setupView(){
        view.addSubview(spaceBackground)
        view.addSubview(backButton)
        view.addSubview(addButton)
    }
    
    private let setVC = SetAlarmViewController()
    
    private let addButton: UIButton = {
       let button = UIButton()
        button.configuration = .gray()
        button.configuration?.cornerStyle = .capsule
        button.configuration?.image = UIImage(systemName: "plus")
//        button.configuration?.title = "+"
        button.configuration?.imagePadding = 6
        button.configuration?.baseBackgroundColor = #colorLiteral(red: 0.1294117647, green: 0.2196078431, blue: 0.2431372549, alpha: 1)
        button.configuration?.baseForegroundColor = #colorLiteral(red: 0.631372549, green: 0.7019607843, blue: 0.7450980392, alpha: 1)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = .boldSystemFont(ofSize: 50)
        button.addTarget(self, action: #selector(addAlarm), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func addAlarm() {
        setVC.modalPresentationStyle = .overFullScreen
        present(setVC, animated: true)
    }
    
    private let backButton: UIButton = {
       let button = UIButton()
        button.configuration = .gray()
        button.configuration?.image = UIImage(systemName: "chevron.left.circle")
        button.configuration?.title = "Back"
        button.configuration?.imagePlacement = .leading
        button.configuration?.imagePadding = 6
        button.configuration?.baseBackgroundColor = #colorLiteral(red: 0.1294117647, green: 0.2196078431, blue: 0.2431372549, alpha: 1)
        button.configuration?.baseForegroundColor = #colorLiteral(red: 0.631372549, green: 0.7019607843, blue: 0.7450980392, alpha: 1)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = .boldSystemFont(ofSize: 25)
        button.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func dismissView(){
        dismiss(animated: true)
    }
    
    private let spaceBackground: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "space")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            spaceBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            spaceBackground.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            spaceBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            spaceBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            backButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addButton.heightAnchor.constraint(equalToConstant: 50),
            addButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}
