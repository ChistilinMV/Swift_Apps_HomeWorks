//
//  CustomTableViewCell.swift
//  HomeWork04 VK_Client
//
//  Created by Max on 27.11.2023.
//

import UIKit

final class CustomFriendsTableViewCell: UITableViewCell {
    
    static let identifier = Constants.IDs.FriendCell
    
    private let friendPhoto: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(systemName: "person")
        photo.layer.cornerRadius = 25
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
        label.text = "Friend name"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(friendPhoto)
        contentView.addSubview(onlineStatusIndicator)
        contentView.addSubview(label)
        setConstraints()
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
