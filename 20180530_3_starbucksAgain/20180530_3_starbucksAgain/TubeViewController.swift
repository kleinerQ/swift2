//
//  TubeViewController.swift
//  20180530_3_starbucksAgain
//
//  Created by user on 2018/5/30.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit

class TubeViewController: UIViewController {

    @IBAction func onSwipe(_ sender: UISwipeGestureRecognizer) {
        let vc = (parent as! ViewController)
        vc.leadingConstrainMovingBar.constant = (-1 * vc.movingBarWidth.constant)
        vc.leadingConstrainContainer.constant = (-1 * vc.containerWidth.constant)
        vc.leadingConstrainTube.constant = (-1 * vc.tubeWidth.constant)
        
        UIView.animate(withDuration: 0.5){
            vc.view.layoutIfNeeded()
        }
    }
    @IBAction func onTabClose(_ sender: UITapGestureRecognizer) {
        let vc = (parent as! ViewController)
        
        vc.leadingConstrainMovingBar.constant = (-1 * vc.movingBarWidth.constant)
        vc.leadingConstrainContainer.constant = (-1 * vc.containerWidth.constant)
        vc.leadingConstrainTube.constant = (-1 * vc.tubeWidth.constant)
        
        UIView.animate(withDuration: 0.5){
            vc.view.layoutIfNeeded()
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
