//
//  MainViewViewController.swift
//  20180529_3
//
//  Created by user on 2018/5/29.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit

class MainViewViewController: UIViewController {
    
    @IBOutlet weak var titleItem: UIView!
    
//    @IBAction func onChange(_ sender: UISwitch) {
//        if sender.isOn{
//            bottomConstraint.constant = 0
//            
//        }else {
//            bottomConstraint.constant = -200
//        }
//        
//        UIView.animate(withDuration: 0.5){
//            self.view.layoutIfNeeded()
//            
//        }
//    }
    
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
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
