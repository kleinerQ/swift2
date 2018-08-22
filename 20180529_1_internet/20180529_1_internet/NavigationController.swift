//
//  NavigationController.swift
//  20180529_1_internet
//
//  Created by user on 2018/5/29.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit
import SystemConfiguration

class NavigationController: UINavigationController,UINavigationControllerDelegate {

    let reach = SCNetworkReachabilityCreateWithName(nil, "google.com.tw")
    
    override func viewDidLoad() {
        delegate = self
        super.viewDidLoad()

        
        

        // Do any additional setup after loading the view.
        

        var n = 0
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (timer) in
            
            if let btn = self.topViewController?.navigationItem.rightBarButtonItem{
                self.checkNetwork(btn)
                print(n)
                n += 1
            }
            
        }
        
    }

    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        print("Hello")
        viewController.navigationItem.titleView = UIImageView(image: UIImage(named: "title"))
        var btn = viewController.navigationItem.rightBarButtonItem      //first time would be nil
        if btn == nil{
            
            btn = UIBarButtonItem()
            viewController.navigationItem.rightBarButtonItem = btn
            
        }
    
        
        checkNetwork(btn!)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func checkNetwork(_ bn: UIBarButtonItem){
        var flag = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reach!, &flag)
        DispatchQueue.main.async{
            
            if flag.contains(.reachable){
               bn.image = UIImage(named: "connected")?.withRenderingMode(.alwaysOriginal)
               
            }else{
               bn.image = UIImage(named: "disconnected")?.withRenderingMode(.alwaysOriginal)
             
                let alert = self.storyboard?.instantiateViewController(withIdentifier: "myalert")
                self.present(alert!, animated: true, completion: nil)
                
            }
            
        }
        
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
