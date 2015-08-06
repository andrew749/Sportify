//
//  TutorialController.swift
//  Sportify
//
//  Created by Andrew Codispoti on 2015-08-05.
//  Copyright (c) 2015 Andrew Codispoti. All rights reserved.
//

import Foundation

class TutorialController:UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    var tutorialPageController:UIPageViewController?
    let xibNames = ["MainViewController","TutorialViewController2", "TutorialViewController3"]
    var tutorialControllers: [UIViewController]?
    var index = 0
    init(){
        super.init(nibName: nil, bundle: nil)
        tutorialPageController = UIPageViewController(transitionStyle: UIPageViewControllerTransitionStyle.Scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal, options: nil)
        self.addChildViewController(tutorialPageController!)
        tutorialControllers = createViewControllers()
    }
    
    override func loadView() {
        super.loadView()
        
        self.view.backgroundColor = UIColor.whiteColor()
        tutorialPageController?.delegate = self
        tutorialPageController?.dataSource = self
        
        
        tutorialPageController?.view.backgroundColor = UIColor.blackColor()
        tutorialPageController!.setViewControllers([tutorialControllers![0]], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        tutorialPageController?.view.frame = self.view.frame
        self.view.addSubview(tutorialPageController!.view!)
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createViewControllers()->[UIViewController]{
        var viewControllers:[UIViewController]=[]
        for x in xibNames{
            viewControllers.append(createController(x))
        }
        return viewControllers
    }
    
    func createController(xibName:String)->UIViewController{
        var viewController = UIViewController()
        viewController.view = NSBundle.mainBundle().loadNibNamed(xibName, owner: self, options: nil)[0] as! UIView
        return viewController
    }
    
//    MARK: UIPageViewControllerDataSource Delegate methods
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let index:Int = find(tutorialControllers!, viewController)!
        self.index = index
        if index > 0{
            return tutorialControllers![index - 1]
        }
        return nil
    }
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let index:Int = find(tutorialControllers!, viewController)!
        self.index = index
        if index < tutorialControllers!.count - 1{
            return tutorialControllers![index + 1]
        }
        if index == tutorialControllers?.count{
            
        }
        return nil
//        else{
//            UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
//            return nil
//        }
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return index
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return tutorialControllers!.count
    }
    
}