//
//  ThemeViewController.swift
//  MegaLitr_VK_Client
//
//  Created by Max on 11.12.2023.
//

import UIKit

protocol ThemeViewDelegate: AnyObject {
    func updateColor()
}

class ThemeView: UIView {
    
    weak var delegate: ThemeViewDelegate?
    
    private var button1:UIButton = {
        var button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = WhiteTheme().backgroundColor
        button.setTitle("White Theme", for: .normal)
        button.setTitleColor(WhiteTheme().fontColor, for: .normal)
        return button
    }()
    
    private var button2:UIButton  = {
        var button = UIButton()
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = NeutralTheme().backgroundColor
        button.setTitle("Neutral Theme", for: .normal)
        button.setTitleColor(NeutralTheme().fontColor, for: .normal)
        return button
    }()
    
    private var button3:UIButton = {
        var button = UIButton()
        button.layer.borderColor = UIColor.darkGray.cgColor
        button.layer.borderWidth = 1
        button.backgroundColor = NightTheme().backgroundColor
        button.setTitle("Night Theme", for: .normal)
        button.setTitleColor(NightTheme().fontColor, for: .normal)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = Theme.currentTheme.backgroundColor
        button1.addTarget(self, action: #selector(tap1), for: .touchUpInside)
        button2.addTarget(self, action: #selector(tap2), for: .touchUpInside)
        button3.addTarget(self, action: #selector(tap3), for: .touchUpInside)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(button1)
        addSubview(button2)
        addSubview(button3)
        setupConstraints()
    }
    
    private func setupConstraints() {
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            button1.centerXAnchor.constraint(equalTo: centerXAnchor),
            button1.widthAnchor.constraint(equalTo: widthAnchor),
            button1.heightAnchor.constraint(equalToConstant: 50),
            
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 10),
            button2.centerXAnchor.constraint(equalTo: centerXAnchor),
            button2.widthAnchor.constraint(equalTo: widthAnchor),
            button2.heightAnchor.constraint(equalToConstant: 50),
            
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 10),
            button3.centerXAnchor.constraint(equalTo: centerXAnchor),
            button3.widthAnchor.constraint(equalTo: widthAnchor),
            button3.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension ThemeView {
    @objc func tap1() {
        Theme.currentTheme = WhiteTheme()
        backgroundColor = Theme.currentTheme.backgroundColor
        delegate?.updateColor()
    }
    
    @objc func tap2() {
        Theme.currentTheme = NeutralTheme()
        backgroundColor = Theme.currentTheme.backgroundColor
        delegate?.updateColor()
    }
    
    @objc func tap3() {
        Theme.currentTheme = NightTheme()
        backgroundColor = Theme.currentTheme.backgroundColor
        delegate?.updateColor()
    }
}

