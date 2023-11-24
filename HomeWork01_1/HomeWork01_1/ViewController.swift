//
//  ViewController.swift
//  HomeWork01_1
//
//  Created by Max on 24.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo1s"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Авторизация"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = UIColor.brown
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Логин"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пароль"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 8
        button.tintColor = .systemBrown
        button.setTitleColor(.white, for: .normal)
        button.configuration = .filled()
        button.configuration!.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 20, bottom: 15, trailing: 20)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        assignbackground()
        setupUI()
    }
    
    private func assignbackground(){
            let background = UIImage(named: "coffe_wall")

            var bgImageView : UIImageView!
            bgImageView = UIImageView(frame: view.bounds)
            bgImageView.contentMode =  UIView.ContentMode.scaleAspectFill
            bgImageView.clipsToBounds = true
            bgImageView.image = background
            bgImageView.center = view.center
            view.addSubview(bgImageView)
            self.view.sendSubviewToBack(bgImageView)
    }
    
    private func setupUI() {
        view.addSubview(logoImageView)
        view.addSubview(titleLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(submitButton)
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 10),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            submitButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

