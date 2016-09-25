//
//  TurtorialPageViewController.swift
//  UIPageViewControllerPra.g
//
//  Created by ling toby on 9/23/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

import UIKit

class TurtorialPageViewController: UIPageViewController {

//3. add array to reference the view controller
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newColoredViewController("Green"),
                self.newColoredViewController("Red"),
                self.newColoredViewController("Blue")]
    }()
    
    private func newColoredViewController(color: String) -> UIViewController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("\(color)ViewController")
    
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
 
        
//1. set dataSource
        dataSource = self
        
        
//4. load up the first view controller
        if let firstViewController = orderedViewControllers.first{
            setViewControllers([firstViewController], direction: .Forward, animated: true, completion: nil)
        }
    }
    
}



//2. confirm to dataSource
extension TurtorialPageViewController: UIPageViewControllerDataSource{
    
    
//5. dataSource, identify the pages.
    
    func  pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }

    func  pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    
    
//6. dots and page numbers
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
            firstViewControllerIndex = orderedViewControllers.indexOf(firstViewController) else {
                return 0
        }
        
        return firstViewControllerIndex
    }
    
    
}


