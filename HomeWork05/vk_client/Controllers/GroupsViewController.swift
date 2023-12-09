//
//  GroupsViewController.swift
//  MegaLitr_VK_Client
//
//  Created by Max on 26.11.2023.
//

import UIKit

final class GroupsViewController: UITableViewController {
    
    private var data = [GroupsDataModel.Response.Group]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .white
        tableView.register(
            CustomGroupsTableViewCell.self,
            forCellReuseIdentifier: CustomGroupsTableViewCell.identifier
        )
        title = "Groups"
        
        NetworkService().getData(request: .groups) { [weak self] groups in
    
            guard let groups = groups as? GroupsDataModel else {
                return
            }
            self?.data = groups.response.items
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomGroupsTableViewCell.identifier, for: indexPath) as? CustomGroupsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(datapoint: data[indexPath.row])
        
        return cell
    }
}
