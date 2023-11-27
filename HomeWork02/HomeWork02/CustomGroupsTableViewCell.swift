//
//  CustomGroupTableViewCell.swift
//  HomeWork02
//
//  Created by Max on 27.11.2023.
//

import UIKit

class CustomGroupsTableViewCell: UITableViewCell {

    private let groupPhoto: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(systemName: "person.2")
        photo.layer.cornerRadius = 10
        photo.backgroundColor = .systemGray6
        photo.clipsToBounds = true
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.contentMode = .scaleAspectFit
        return photo
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Group name"
        label.textColor = .systemBlue
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let label2: UILabel = {
        let label = UILabel()
        label.text = "Group description"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(groupPhoto)
        contentView.addSubview(label)
        contentView.addSubview(label2)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            groupPhoto.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            groupPhoto.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            groupPhoto.heightAnchor.constraint(equalToConstant: 100),
            groupPhoto.widthAnchor.constraint(equalTo: groupPhoto.heightAnchor),
            groupPhoto.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10),
            
            label.leftAnchor.constraint(equalTo: groupPhoto.rightAnchor, constant: 20),
            label.topAnchor.constraint(equalTo: groupPhoto.topAnchor),
            label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            label.bottomAnchor.constraint(equalTo: groupPhoto.centerYAnchor, constant: -5),
            
            label2.leftAnchor.constraint(equalTo: groupPhoto.rightAnchor, constant: 20),
            label2.topAnchor.constraint(equalTo: groupPhoto.centerYAnchor, constant: 5),
            label2.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            label2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
