//
//  myTabBarViewController.swift
//  testDemo_CYwithout
//
//  Created by Cyen on 2018/8/21.
//  Copyright © 2018年 Cyen. All rights reserved.
//

import UIKit

class myTabBarViewController: UITabBarController {

    var CVCN = UINavigationController()
    override func viewDidLoad() {
        super.viewDidLoad()

        let AVC = CViewController()
        AVC.view.backgroundColor = UIColor.orange
        let BVC = CViewController()
        BVC.view.backgroundColor = UIColor.blue
        let CVC = DViewController()
        CVCN = UINavigationController(rootViewController: CVC)
        CVC.view.backgroundColor = UIColor.purple
        CVCN.navigationBar.topItem?.title = "ag"
        CVCN.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.stop, target: nil, action: #selector(done))
        //CVCN.navigationBar.topItem?.title = "CViewController"
        //let navItem = UINavigationItem(title: "tt")

        AVC.tabBarItem = UITabBarItem(title: "A", image: nil, tag: 0)
        BVC.tabBarItem = UITabBarItem(title: "B", image: nil, tag: 1)
        CVCN.tabBarItem = UITabBarItem(title: "C", image: nil, tag: 2)
        
        let button: UIButton = UIButton(frame: CGRect(x: view.bounds.width / 2 - 50, y: view.bounds.height / 2, width: 100, height: 50))
        button.backgroundColor = UIColor.black
        button.addTarget(self, action: #selector(pushToNextVC), for: .touchUpInside)
        self.view.addSubview(button)
        let controllers = [AVC, BVC, CVCN]
        self.viewControllers = controllers
        self.selectedIndex = 2
        print("GSDF")
        
        // Do any additional setup after loading the view.
    }

    @objc func done(){
        self.dismiss(animated: true, completion: nil)
    }
    @objc func pushToNextVC() {
        print("ggggg")
        let newVC = DViewController()
        newVC.view.backgroundColor = UIColor.red
        //self.moreNavigationController = UINavigationController()

        let myBackItem = UIBarButtonItem()
        myBackItem.title = "Back"
        CVCN.navigationBar.topItem?.backBarButtonItem = myBackItem
        
        CVCN.pushViewController(newVC, animated:
            true)
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
