//
//  SetAlarmViewController.swift
//  Coin Alarm
//
//  Created by Владислав Семенец on 15.03.2022.
//

import UIKit

class SetAlarmViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
        addTaps()
    }
    
    private func setupView(){
        view.addSubview(spaceBackground)
        view.addSubview(backButton)
        view.addSubview(coinLabel)
        view.addSubview(coinTextField)
        view.addSubview(saveButton)
    }
    
    private let spaceBackground: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "space")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
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
    
    private let coinLabel : UILabel = {
       let label = UILabel()
        label.text = "Bitcoin"
        label.backgroundColor = .clear
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.631372549, green: 0.7019607843, blue: 0.7450980392, alpha: 1)
        label.font = .boldSystemFont(ofSize: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.tintColor = #colorLiteral(red: 0.631372549, green: 0.7019607843, blue: 0.7450980392, alpha: 1)
        button.titleLabel?.font = .boldSystemFont(ofSize: 35)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.addTarget(self, action: #selector(saveTaped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func saveTaped() {
        print("save tapped")
        
    }
    
     let coinTextField: UITextField = {
       let textField = UITextField()
         textField.placeholder = "39323,232"
         textField.borderStyle = .none
         textField.backgroundColor = #colorLiteral(red: 0.5456292629, green: 0.5456292629, blue: 0.5456292629, alpha: 1)
         textField.layer.cornerRadius = 10
         textField.adjustsFontSizeToFitWidth = true
         textField.textColor = #colorLiteral(red: 0.631372549, green: 0.7019607843, blue: 0.7450980392, alpha: 1)
         textField.font = .boldSystemFont(ofSize: 25)
         textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
         textField.leftViewMode = .always
         textField.clearButtonMode = .always
         textField.returnKeyType = .done
         textField.keyboardType = .numberPad
         textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private func addTaps() {
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(tapScreen)
        
        let swipeScreen = UISwipeGestureRecognizer(target: self, action: #selector(swipeHideKeyboard))
        swipeScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(swipeScreen)
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func swipeHideKeyboard() {
        view.endEditing(true)
    }
    
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
            coinLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            coinLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            coinLabel.heightAnchor.constraint(equalToConstant: 40),
            coinLabel.widthAnchor.constraint(equalToConstant: 250)
        ])
        NSLayoutConstraint.activate([
            coinTextField.topAnchor.constraint(equalTo: coinLabel.bottomAnchor, constant: 10),
            coinTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            coinTextField.heightAnchor.constraint(equalToConstant: 30),
            coinTextField.widthAnchor.constraint(equalToConstant: 200)
        ])
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: coinTextField.bottomAnchor, constant: 20),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 35),
            saveButton.widthAnchor.constraint(equalToConstant: 70)
        ])
    }
}
