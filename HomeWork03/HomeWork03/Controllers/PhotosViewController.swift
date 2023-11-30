//
//  PhotosViewController.swift
//  HomeWork03
//
//  Created by Max on 27.11.2023.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosViewController: UICollectionViewController {

    private let images = ["person.and.arrow.left.and.arrow.right", "person", "person.circle", "person.2", "person.wave.2", "person.2.circle"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
                return
            }
        let width = (collectionView.frame.size.width - layout.minimumInteritemSpacing - 50) / 2
        layout.itemSize = CGSize(width: width, height: width)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 10
        
        view.backgroundColor = .white
        setConstraints()
        
        collectionView.register(CustomPhotoViewCell.self, forCellWithReuseIdentifier: "cell")
        title = "Photos"
        
        NetworkService().getData(request: .groups)
    }
    
    private func setConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10)
        ])
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        guard let collectionViewCell = collectionViewCell as? CustomPhotoViewCell else {
            return UICollectionViewCell()
        }
        
        collectionViewCell.setImage(image: images[indexPath.item])
        
        collectionViewCell.tap = {[weak self] image in
            self?.navigationController?.pushViewController(ImageViewController(image: image), animated: true)
        }

        return collectionViewCell
    }
    
}
