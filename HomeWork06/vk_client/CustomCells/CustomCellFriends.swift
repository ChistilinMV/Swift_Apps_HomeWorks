//
//  CustomCellFriends.swift
//  MegaLitr_VK_Client
//
//  Created by Max on 27.11.2023.
//

import UIKit 

final class CustomCellFriends: UITableViewCell {
    
    static let identifier = Constants.IDs.FriendCell
    
    var tap: ((String,UIImage) -> Void)?
    
    private let friendPhoto: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(systemName: "person")
        photo.layer.cornerRadius = 10
        photo.backgroundColor = .systemGray6
        photo.clipsToBounds = true
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.contentMode = .scaleAspectFit
        return photo
    }()
    
    private let onlineStatusIndicator: UIView = {
        let label = UIView()
        label.backgroundColor = .none
        label.layer.cornerRadius = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        return label
    }()
    
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Some dummy text"
        label.textColor = Theme.currentTheme.fontColor
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = Theme.currentTheme.backgroundColor
        loadAll()
        setConstraints()
        let recogniser = UITapGestureRecognizer(
            target: self,
            action: #selector(cellTap)
        )
        addGestureRecognizer(recogniser)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadAll() {
        contentView.addSubview(friendPhoto)
        contentView.addSubview(onlineStatusIndicator)
        contentView.addSubview(label)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            friendPhoto.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            friendPhoto.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            friendPhoto.heightAnchor.constraint(equalToConstant: 100),
            friendPhoto.widthAnchor.constraint(equalTo: friendPhoto.heightAnchor),
            friendPhoto.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10),
            
            onlineStatusIndicator.widthAnchor.constraint(equalToConstant: 10),
            onlineStatusIndicator.heightAnchor.constraint(equalToConstant: 10),
            onlineStatusIndicator.rightAnchor.constraint(equalTo: friendPhoto.rightAnchor, constant: -7),
            onlineStatusIndicator.bottomAnchor.constraint(equalTo: friendPhoto.bottomAnchor, constant: -7),
            
            label.leftAnchor.constraint(equalTo: friendPhoto.rightAnchor, constant: 10),
            label.centerYAnchor.constraint(equalTo: friendPhoto.centerYAnchor),
            label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            
        ])
    }
    
    override func prepareForReuse() {
        label.text = ""
        friendPhoto.image = .none
        onlineStatusIndicator.backgroundColor = .none
        backgroundColor = Theme.currentTheme.backgroundColor
        label.textColor = Theme.currentTheme.fontColor
    }
    
    @objc func cellTap() {
        tap?(label.text ?? "", friendPhoto.image ?? UIImage())
    }
    
    func configure(datapoint: FriendsDataModel.Response.Friend) {
        
        let firstName = datapoint.firstName ?? ""
        let lastName = datapoint.lastName ?? ""
        label.text = firstName + " " + lastName
        
        if datapoint.online == 1 {
            onlineStatusIndicator.backgroundColor = .green
        }
    
        DispatchQueue.global().async {
            if let url = URL(string: datapoint.photo ?? ""),
                let data = try? Data(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.friendPhoto.image = UIImage(data: data)
                }
            }
        }
    }
}

