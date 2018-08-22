//
//  MyNavigationController.swift
//  20180529_5_internetcheck
//
//  Created by user on 2018/5/29.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit
import SystemConfiguration
class MyNavigationController: UINavigationController,UINavigationControllerDelegate {

    
    let reach = SCNetworkReachabilityCreateWithName(nil, "tw.yahoo.com")
    
    
    
    func checkNetwork(_ bt: UIBarButtonItem){
        
        var flag = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reach!, &flag)
        DispatchQueue.main.async {
            if flag.contains(.reachable){
                
                bt.image = UIImage(named: "wifi")?.withRenderingMode(.alwaysOriginal)
                
                
            }else{
                bt.image = UIImage(named: "nowifi")?.withRenderingMode(.alwaysOriginal)
                
            }
        }

    }
    
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        print("Hello")

        var btn = viewController.navigationItem.rightBarButtonItem
        if btn == nil {
            btn = UIBarButtonItem()
            viewController.navigationItem.rightBarButtonItem = btn
            
        }
        checkNetwork(btn!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self

//        checkNetwork()
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true){ (timer) in
            if let btn = self.topViewController?.navigationItem.rightBarButtonItem{
                self.checkNetwork(btn)
            }
            
            
        }
        // Do any additional setup after loading the view.
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
