//
//  FriendsViewController.swift
//  MegaLitr_VK_Client
//
//  Created by Max on 26.11.2023.
//

import UIKit

final class FriendsViewController: UITableViewController {
    
    private let networkService: NetworkServiceProtocol
    private var fileCache: FileCacheProtocol
    private var data = [FriendsDataModel.Response.Friend]()
    private var profileViewController = ProfileViewController(isOwner: true)
    
    init(networkService: NetworkServiceProtocol, data: [FriendsDataModel.Response.Friend], fileCache: FileCacheProtocol) {
        self.networkService = networkService
        self.data = data
        self.fileCache = fileCache
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Friends"
        tableView.backgroundColor = Theme.currentTheme.backgroundColor
        tableView.register(
            CustomCellFriends.self,
            forCellReuseIdentifier: CustomCellFriends.identifier
        )
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Profile",
            style: .plain,
            target: self,
            action: #selector(rightBarButtonTapped)
        )
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(
            self,
            action: #selector(updateData),
            for: .valueChanged
        )
        
        profileViewController.delegate = self
        updateData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Theme.currentTheme.fontColor]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellFriends.identifier, for: indexPath) as? CustomCellFriends else {
            return UITableViewCell()
        }
        
        cell.configure(datapoint: data[indexPath.row])
        
        cell.tap = {[weak self] name, photo in
            self?.navigationController?.pushViewController(
                ProfileViewController(
                    name: name,
                    photo: photo,
                    isOwner: false),
                animated: true)
        }
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
        
        navigationController?.pushViewController(profileViewController, animated: false)
    }
    
    func showAlert() {
        let date: String = fileCache.fetchFriendsDate()
        let alert = UIAlertController(
            title: "Error while loading the data",
            message: "The cached data is as of \(date)",
            preferredStyle: .alert
        )
        alert.addAction(
            UIAlertAction(
                title: "Закрыть",
                style: .default,
                handler: nil
            )
        )
        present(alert, animated: true, completion: nil)
    }
    
    @objc func updateData() {
        networkService.getData(request: .friends) { [weak self] result in
            switch result {
            case .success(let friends):
                guard let friends = friends as? FriendsDataModel else { return }
                self?.data = friends.response.items
                self?.fileCache.addFriends(friends: friends.response.items)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(_):
                self?.data = self?.fileCache.fetchAllFriends() ?? []
                DispatchQueue.main.async {
                    self?.showAlert()
                    self?.tableView.reloadData()
                }
            }
            DispatchQueue.main.async {
                self?.refreshControl?.endRefreshing()
            }
        }
    }
    
}

