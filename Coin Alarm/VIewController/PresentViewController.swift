//
//  PresentViewController.swift
//  Coin Alarm
//
//  Created by Владислав Семенец on 15.03.2022.
//

import UIKit


class PresentViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setConstraints()
    }
    
    private func setupView() {
        view.backgroundColor = .gray
        view.addSubview(backgroundView)
        view.addSubview(presentButton)
        view.addSubview(coinImage)
        view.addSubview(animateView)
        view.addSubview(welcomeLabel)
        view.addSubview(labelBackground)
        view.addSubview(coinLabel)
    }
    
    private let backgroundView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let mainVC = MainViewController()
    
    private let animateView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.3215686275, green: 0.7019607843, blue: 0.7294117647, alpha: 1)
        view.layer.cornerRadius = 30
        view.frame = CGRect(x: 319, y: 793, width: 60, height: 0)
        return view
    }()
    
    private let coinImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "coinBlue")
        image.layer.cornerRadius = 45
        image.alpha = 0
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let welcomeLabel : UILabel = {
       let label = UILabel()
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 25)
        label.textColor = #colorLiteral(red: 0.631372549, green: 0.7019607843, blue: 0.7450980392, alpha: 1)
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.text = "Hey, Dude!        Welcome to "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let coinLabel : UILabel = {
       let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 35)
        label.textColor = #colorLiteral(red: 0.4980392157, green: 0.2470588235, blue: 0.07450980392, alpha: 1)
//        label.backgroundColor = #colorLiteral(red: 0.631372549, green: 0.7019607843, blue: 0.7450980392, alpha: 1)
        label.textAlignment = .left
        label.text = "Coin Alarm"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let labelBackground : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.631372549, green: 0.7019607843, blue: 0.7450980392, alpha: 1)
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let presentButton: UIButton = {
       let button = UIButton()
        button.configuration = .gray()
        button.configuration?.cornerStyle = .capsule
        button.titleLabel?.font = .boldSystemFont(ofSize: 35)
        button.configuration?.imagePlacement = .bottom
        button.configuration?.image = UIImage(systemName: "hand.tap")
        button.configuration?.baseForegroundColor = #colorLiteral(red: 0.4980392157, green: 0.2470588235, blue: 0.07450980392, alpha: 1)
        button.configuration?.baseBackgroundColor = #colorLiteral(red: 0.631372549, green: 0.7019607843, blue: 0.7450980392, alpha: 1)
        button.addTarget(self, action:#selector(animate), for: .touchDown)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func animate() {
        UIView.animate(withDuration: 2) {
            self.animateView.frame = CGRect(x: 319, y: 793, width:self.presentButton.frame.width, height:  -200)
            self.presentButton.alpha = 0.3
            self.presentButton.configuration?.baseBackgroundColor = .darkGray
            self.coinImage.alpha = 1
        } completion: { done in
            
            self.mainVC.modalPresentationStyle = .overFullScreen
            self.present(self.mainVC, animated: true, completion: nil)
            self.presentButton.alpha = 1
            self.presentButton.configuration?.baseBackgroundColor = #colorLiteral(red: 0.631372549, green: 0.7019607843, blue: 0.7450980392, alpha: 1)
            self.animateView.alpha = 0
            self.coinImage.alpha = 0
            self.animateView.frame = CGRect(x: 319, y: 793, width: 60, height: 0)
            self.animateView.alpha = 1
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        NSLayoutConstraint.activate([
            coinImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            coinImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 500),
            coinImage.widthAnchor.constraint(equalToConstant: 90),
            coinImage.heightAnchor.constraint(equalToConstant: 90)
        ])
        NSLayoutConstraint.activate([
            presentButton.topAnchor.constraint(equalTo: coinImage.bottomAnchor, constant: 5),
            presentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            presentButton.widthAnchor.constraint(equalToConstant: 60),
            presentButton.heightAnchor.constraint(equalToConstant: 200)
        ])
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 100),
            welcomeLabel.widthAnchor.constraint(equalToConstant: 110),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60)
        ])
        NSLayoutConstraint.activate([
            coinLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 115),
            coinLabel.heightAnchor.constraint(equalToConstant: 45),
            coinLabel.widthAnchor.constraint(equalToConstant: 150),
            coinLabel.leadingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor, constant: 4)
        ])
        NSLayoutConstraint.activate([
            labelBackground.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 115),
            labelBackground.heightAnchor.constraint(equalToConstant: 45),
            labelBackground.widthAnchor.constraint(equalToConstant: 150),
            labelBackground.leadingAnchor.constraint(equalTo: welcomeLabel.trailingAnchor, constant: 4)
        ])
    }
}
