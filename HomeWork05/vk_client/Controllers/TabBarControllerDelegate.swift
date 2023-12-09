//
//  TabBarControllerDelegate.swift
//  MegaLitr_VK_Client
//
//  Created by Max on 29.11.2023.
//

import UIKit

final class TabBarControllerDelegate: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        title = "Friends"
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        self.navigationItem.title = viewController.title
    }
}
