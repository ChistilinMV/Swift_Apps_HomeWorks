//
//  ImageViewController.swift
//  MegaLitr_VK_Client
//
//  Created by Max on 27.11.2023.
//

import UIKit

final class ImageViewController: UIViewController {
    
    private var imageView = UIImageView()
    
    init(image: UIImage) {
        super.init(nibName: nil, bundle: nil)
        imageView.image = image
        title = "ImageViewController"
        view.backgroundColor = Theme.currentTheme.backgroundColor
        imageView.contentMode = .scaleAspectFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 10),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),

        ])
    }
}

