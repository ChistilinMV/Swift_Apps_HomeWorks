//
//  FriendsViewController.swift
//  MegaLitr_VK_Client
//
//  Created by Max on 26.11.2023.
//

import UIKit

final class FriendsViewController: UITableViewController {
    
    private var data = [FriendsDataModel.Response.Friend]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(rightBarButtonTapped))
        tableView.backgroundColor = .white
        tableView.register(
            CustomFriendsTableViewCell.self,
            forCellReuseIdentifier: CustomFriendsTableViewCell.identifier
        )
        title = "Friends"
        
        NetworkService().getData(request: .friends) { [weak self] friends in
            
            guard let friends = friends as? FriendsDataModel else {
                return
            }
            self?.data = friends.response.items
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomFriendsTableViewCell.identifier, for: indexPath) as? CustomFriendsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(datapoint: data[indexPath.row])
        
        return cell
    }
    
}

extension FriendsViewController {
    
    @objc func rightBarButtonTapped() {

        let animation = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.duration = 0.5
        animation.type = .reveal
        animation.subtype = .fromRight
        
        self.navigationController?.view.layer.add(animation, forKey: nil)
        
        let newViewController = UserProfileViewController()
        
        navigationController?.pushViewController(newViewController, animated: false)
    }
    
}
