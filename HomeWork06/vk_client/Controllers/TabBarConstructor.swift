//
//  TabBarFunc.swift
//  MegaLitr_VK_Client
//
//  Created by Max on 04.12.2023.
//

import UIKit

final class TabBarConstructor {
        
    static func run() -> UITabBarController {
        
        let controller1 = UINavigationController(rootViewController: FriendsViewController())
        let controller2 = UINavigationController(rootViewController: GroupsViewController())
        let controller3 = UINavigationController(rootViewController: PhotosViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        
        controller1.tabBarItem = UITabBarItem(title: "Friends", image: UIImage(systemName: "person"), tag: 0)
        controller2.tabBarItem = UITabBarItem(title: "Groups", image: UIImage(systemName: "person.3"), tag: 1)
        controller3.tabBarItem = UITabBarItem(title: "Photos", image: UIImage(systemName: "photo"), tag: 2)
        
        let controllers = [controller1, controller2, controller3]
        
        let myTabBarController = UITabBarController()
        myTabBarController.viewControllers = controllers
        myTabBarController.tabBar.backgroundColor = .systemGray6
        
        return myTabBarController
        
    }
}

