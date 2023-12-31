//
//  GroupsViewController.swift
//  MegaLitr_VK_Client
//
//  Created by Max on 26.11.2023.
//

import UIKit

final class GroupsViewController: UITableViewController {
    
    private var data = [GroupsDataModel.Response.Group]()
    private var networkService = NetworkService()
    private var fileCache = FileCache()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Groups"
        tableView.backgroundColor = Theme.currentTheme.backgroundColor
        tableView.register(
            CustomCellGroups.self,
            forCellReuseIdentifier: CustomCellGroups.identifier
        )
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(
            self,
            action: #selector(updateData),
            for: .valueChanged
        )
        
        updateData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
        view.backgroundColor = Theme.currentTheme.backgroundColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Theme.currentTheme.fontColor]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCellGroups.identifier, for: indexPath) as? CustomCellGroups else {
            return UITableViewCell()
        }
        
        cell.configure(datapoint: data[indexPath.row])
        
        return cell
    }
}

extension GroupsViewController {
    
    func showAlert() {
        let date: String = fileCache.fetchGroupsDate()
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
        networkService.getData(request: .groups) { [weak self] result in
            switch result {
            case .success(let groups):
                guard let groups = groups as? GroupsDataModel else { return }
                self?.data = groups.response.items
                self?.fileCache.addGroups(groups: groups.response.items)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(_):
                self?.data = self?.fileCache.fetchAllGroups() ?? []
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

