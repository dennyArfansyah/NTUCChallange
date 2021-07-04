//
//  HomeController.swift
//  NTUCChallange
//
//  Created by Denny Arfansyah on 04/07/21.
//

import UIKit

class HomeController: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let listController = ListController()
        let listControllerIcon = UITabBarItem(title: "Timeline", image: UIImage(systemName: "rectangle.grid.1x2"), selectedImage: UIImage(systemName: "rectangle.grid.1x2.fill"))
        listController.tabBarItem = listControllerIcon
        
        let carouselController = CarouselController()
        let carouselControllerIcon = UITabBarItem(title: "Carousel", image: UIImage(systemName: "capsule"), selectedImage: UIImage(systemName: "capsule.fill"))
        carouselController.tabBarItem = carouselControllerIcon
        
        self.viewControllers = [listController, carouselController]
    }
    
}
