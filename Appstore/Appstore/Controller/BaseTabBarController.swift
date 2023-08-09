//
//  BaseTabController.swift
//  Appstore
//
//  Created by FiiFi Acquaah on 8/9/23.
//
import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        
        self.viewControllers = [
            createNavController(viewController: UIViewController(), title: "Apps", image: "square.stack.3d.up.fill"),
            createNavController(viewController: UIViewController(), title: "Search", image: "magnifyingglass"),
            createNavController(viewController: UIViewController(), title: "Today", image: "calendar")
        ]
        
    }
    
    
    fileprivate func createNavController(viewController: UIViewController, title: String, image: String) -> UIViewController {
        
        let viewController = viewController
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem.title = title
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.tabBarItem.image = UIImage(systemName: image)
        
        return navigationController
    }
}
