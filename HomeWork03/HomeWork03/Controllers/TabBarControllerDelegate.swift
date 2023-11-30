//
//  TabBarControllerDelegate.swift
//  HomeWork03
//
//  Created by Max on 29.11.2023.
//

import UIKit

final class TabBarControllerDelegate: UITabBarController, UITabBarControllerDelegate {
    
    static func setTabBar() -> TabBarControllerDelegate {
        
        let controller1 = FriendsViewController()
        let controller2 = GroupsViewController()
        let controller3 = PhotosViewController(collectionViewLayout: UICollectionViewFlowLayout())
        
        controller1.tabBarItem = UITabBarItem(title: "Friends", image: UIImage(systemName: "person"), tag: 0)
        controller2.tabBarItem = UITabBarItem(title: "Groups", image: UIImage(systemName: "person.3"), tag: 1)
        controller3.tabBarItem = UITabBarItem(title: "Photos", image: UIImage(systemName: "photo"), tag: 2)
        
        let controllers = [controller1, controller2, controller3]
        
        let myTabBarController = TabBarControllerDelegate()
        myTabBarController.viewControllers = controllers
        myTabBarController.tabBar.backgroundColor = .systemGray6
        
        return myTabBarController
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        title = "Friends"
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        self.navigationItem.title = viewController.title
    }
}
