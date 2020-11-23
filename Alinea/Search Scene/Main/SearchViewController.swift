//
//  SearchViewController.swift
//  Alinea
//
//  Created by Kapil Sardana on 21/11/20.
//  Copyright © 2020 Kapil Sardana. All rights reserved.
//

import UIKit



class SearchViewController: UIViewController {
    
    var tabArray = ["Category","Themes", "Trending"]
    
    var selectedView : CustomView?
    var headerView : UIView?
    var pageController: UIPageViewController!
    
    var controllerArray = [UIViewController]()
    
    let sb: UIStoryboard? = UIStoryboard(name: "Main", bundle: nil)
    
    var categoryVC : CategoryViewController?
    var themesVC : ThemesViewController?
    var trendingVC : TrendingViewController?
    
    var categoryController : CategoryViewController {
        if categoryVC == nil {
            let contentVC = sb?.instantiateViewController(withIdentifier: "category") as! CategoryViewController
            return contentVC
        }
        return categoryVC!
    }
    var themesController : ThemesViewController {
        if themesVC == nil {
            let contentVC = sb?.instantiateViewController(withIdentifier: "themes") as! ThemesViewController
            return contentVC
        }
        return themesVC!
    }
    var trendingController : TrendingViewController {
        if trendingVC == nil {
            let contentVC = sb?.instantiateViewController(withIdentifier: "trending") as! TrendingViewController
            return contentVC
        }
        return trendingVC!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hex: "f5f5f5")
        setUpNavigationBar()
        createHeaderView()
        populateControllerArray()
        addPageControllerOnView()
        // Do any additional setup after loading the view.
    }
    
}

extension SearchViewController {
    func setUpNavigationBar(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu"), style: .plain, target: self, action: #selector(leftMenuTapped))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "notification"), style: .plain, target: self, action: #selector(notificationsTapped))
        self.navigationItem.title = "Explore"
        self.navigationItem.leftBarButtonItem?.tintColor = .systemGray
        self.navigationItem.rightBarButtonItem?.tintColor = .systemGray
        
    }
    
    func createHeaderView(){
        let headerView = UIView(frame: CGRect(x: 0, y: 88, width: self.view.frame.size.width, height: 50))
        
        self.view.addSubview(headerView)
        
        let itemWidth = (Float(UIScreen.main.bounds.width) - Float(tabArray.count - 1))/Float(tabArray.count)
        
        for (index,name) in tabArray.enumerated() {
            let view = CustomView(frame: CGRect(x: index*Int(itemWidth) + index, y: 0, width: Int(itemWidth), height: 50))
            headerView.addSubview(view)
            view.customDelegate = self
            view.label.text = name
            if index == 0 {
                view.selectView()
                selectedView = view
            }else{
                view.unSelectView()
            }
            view.tag = index
            if index < tabArray.count - 1 {
                let seperator = UIView(frame: CGRect(x: Int(itemWidth*Float((index + 1))), y: 20, width: 1, height: 20))
                seperator.backgroundColor = .lightGray
                headerView.addSubview(seperator)
            }
        }
        self.headerView = headerView
        
    }
    
    @objc func leftMenuTapped() {
        
    }
    @objc func notificationsTapped() {
        
    }
    
    func addPageControllerOnView(){
        let sb: UIStoryboard? = UIStoryboard(name: "Main", bundle: nil)
        self.pageController = sb?.instantiateViewController(withIdentifier: "PageControllerVC") as! PageControllerVC
        let yVal = 88 + 50

        let height = UIScreen.main.bounds.size.height - CGFloat(yVal);
        self.pageController.view.frame = CGRect(x: 0, y: 138, width: self.view.frame.size.width, height: height)
        self.addChild(self.pageController)
        self.view.addSubview(self.pageController.view)
        self.pageController.didMove(toParent: self)
        
        self.pageController.delegate = self
        self.pageController.dataSource = self
        
        self.pageController.setViewControllers([viewController(At: 0)!], direction: .forward, animated: true, completion: nil)
        
    }
    
    func viewController(At index: Int) -> UIViewController? {
        
        if((controllerArray.count == 0) || (index >= controllerArray.count)) {
            return nil
        }
        return controllerArray[index]

    }
    
    func populateControllerArray(){
        controllerArray.append(categoryController)
        controllerArray.append(themesController)
        controllerArray.append(trendingController)
    }
    
    func updateHeaderViewSelection(_ index : Int) {
        if let hView = headerView {
            for view in hView.subviews {
                if let vw = view as? CustomView {
                    if vw.tag == index {
                        selectedView?.unSelectView()
                        selectedView = vw
                        selectedView?.selectView()
                    }
                }
            }
        }
    }
}


extension SearchViewController : CustomviewTapDelegate{
    func viewTapped(_ view : CustomView) {
        let prev = (selectedView?.tag)!
        let next = view.tag
        selectedView?.unSelectView()
        selectedView = view
        selectedView?.selectView()
        self.pageController.setViewControllers([viewController(At: view.tag)!], direction: next > prev ? .forward : .reverse, animated: true, completion: nil)
    }
}


extension SearchViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var cIndex = 0
        for (index,item) in controllerArray.enumerated() {
            if item == viewController {
                cIndex = index
            }
        }
        
        if cIndex == 0 {
            return nil
        }
        
        return self.viewController(At: cIndex-1)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let count = controllerArray.count
        var cIndex = 0
        for (index,item) in controllerArray.enumerated() {
            if item == viewController {
                cIndex = index
            }
        }
        
        if cIndex == count - 1{
            return nil
        }
        
        return self.viewController(At: cIndex + 1)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if finished {
            if completed {
                var cIndex = 0
                for (index,item) in controllerArray.enumerated() {
                    if item == pageViewController.viewControllers!.first {
                        cIndex = index
                        break
                    }
                }
                updateHeaderViewSelection(cIndex)
            }
        }
        
    }
    
}
