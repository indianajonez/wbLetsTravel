//
//  TapBarController.swift
//  MyHabits
//
//  Created by Ekaterina Saveleva on 17.04.2023.
//

import UIKit

class TabBarController: UITabBarController {
    let firstVC = HabitsViewController() 
    let secondVC = InfoViewController()
    
    override func viewDidLoad() {
        setupControllers() 
        super.viewDidLoad()
        
        UINavigationBar.appearance().backgroundColor = .systemGray6
        UITabBar.appearance().backgroundColor = .systemGray6
        UITabBar.appearance().barTintColor = UIColor(red: 242, green: 242, blue: 247)
        UITabBar.appearance().tintColor = UIColor(red: 161, green: 22, blue: 204)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(red: 161, green: 22, blue: 204)], for:.normal)
    }
    
    func setupControllers() {
        firstVC.tabBarItem.title = "Перелеты"
        firstVC.navigationItem.title = "Перелеты"
        secondVC.tabBarItem.title = "Подробнее"
        secondVC.navigationItem.title = "Подробнее"
        
        firstVC.tabBarItem.image = UIImage(systemName: "airplane")
        secondVC.tabBarItem.image = UIImage(systemName: "exclamationmark.bubble.circle.fill")
        
        let firstNavigationVC = UINavigationController(rootViewController: firstVC)
        let secondNavigationVC = UINavigationController(rootViewController: secondVC)
        
        viewControllers = [firstNavigationVC, secondNavigationVC]
        
    }
    
}
