//
//  RootTabBarController.swift
//  Alinea
//
//  Created by Kapil Sardana on 21/11/20.
//  Copyright © 2020 Kapil Sardana. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        customize()
        self.selectedIndex = 1
        // Do any additional setup after loading the view.
    }
    
    private func customize() {
        
        self.tabBar.barTintColor = .white
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = .darkGray
        
        let tabBarItems = self.tabBar.items
        tabBarItems?[0].title = ""
        tabBarItems?[0].image = UIImage(named: "home")
        tabBarItems?[0].selectedImage = UIImage(named: "home")
        
        tabBarItems?[1].title = ""
        tabBarItems?[1].image = UIImage(named: "search")
        tabBarItems?[1].selectedImage = UIImage(named: "search")
        
        tabBarItems?[2].title = ""
        tabBarItems?[2].image = UIImage(named: "trending")
        tabBarItems?[2].selectedImage = UIImage(named: "trending")
        
        tabBarItems?[3].title = ""
        tabBarItems?[3].image = UIImage(named: "people")
        tabBarItems?[3].selectedImage = UIImage(named: "people")
        
        tabBarItems?[4].title = ""
        tabBarItems?[4].image = UIImage(named: "bulb")
        tabBarItems?[4].selectedImage = UIImage(named: "bulb")
        
        self.delegate = self
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension RootTabBarController : UITabBarControllerDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // When a particular tab is selected
//        print("Selected item")
    }
    
}
