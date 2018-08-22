//
//  MybookingUserInfoInputViewController.swift
//  201806_prj_1
//
//  Created by Yen on 2018/6/14.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class MybookingUserInfoInputViewController: UIViewController {

    @IBAction func onClickRequery(_ sender: UIBarButtonItem) {
        
        let parentVc = parent as! ViewController
        
        parentVc.bookingUserInfoViewRightConstraint.constant = -380
        parentVc.timeTableQueryRightConstraint.constant = -380
        parentVc.returnTimeQueryRightConstraint.constant = -380
        
        
        UIView.animate(withDuration: 0.5){
            (self.parent as! ViewController).view.layoutIfNeeded()
        }
        
        
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
