//
//  MyHomePageViewController.swift
//  201806_prj_1
//
//  Created by Yen on 2018/6/5.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class MyHomePageViewController: UIViewController {

    @IBAction func onClickTicketingPage(_ sender: UIButton) {
//        print("AA")
        
        let vc = parent as! UITabBarController
        vc.selectedIndex = 2
        
        
    }
    
    
    @IBAction func onClickBookingPage(_ sender: UIButton) {
        
        let vc = parent as! UITabBarController
        vc.selectedIndex = 1
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
