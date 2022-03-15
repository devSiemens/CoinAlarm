//
//  GoAlarmView.swift
//  Coin Alarm
//
//  Created by Владислав Семенец on 15.03.2022.
//

import UIKit

class GoAlarmView: UIView {
    override init(frame: CGRect) {
        super .init(frame: frame)
        setupView()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let alarmVC = AlarmViewController()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 45)
        label.textColor = #colorLiteral(red: 0.631372549, green: 0.7019607843, blue: 0.7450980392, alpha: 1)
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.text = "Don't oversleep     set an"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupView(){
        backgroundColor = #colorLiteral(red: 0.1294117647, green: 0.2196078431, blue: 0.2431372549, alpha: 1)
//        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 40
        addSubview(label)
     
    }
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.heightAnchor.constraint(equalToConstant: 90),
            label.widthAnchor.constraint(equalToConstant: 200)
        ])
        
    }
}
