//
//  CustomPhotoViewCellCollectionViewCell.swift
//  HomeWork03
//
//  Created by Max on 27.11.2023.
//

import UIKit

final class CustomPhotoViewCell: UICollectionViewCell {
    var tap: ((UIImage) -> Void)?
    
    private var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height))
        
        imageView.image = UIImage(systemName: "person")
        addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        
        let recogniser = UITapGestureRecognizer(target: self, action: #selector(cellTap))
        addGestureRecognizer(recogniser)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(image: String) {
        imageView.image = UIImage(systemName: image)
    }
    
    @objc func cellTap() {
        tap?(imageView.image ?? UIImage())
    }
    
}
