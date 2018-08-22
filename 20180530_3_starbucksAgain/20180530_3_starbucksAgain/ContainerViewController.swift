//
//  ContainerViewController.swift
//  20180530_3_starbucksAgain
//
//  Created by user on 2018/5/30.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    var originalX:CGFloat! = 0
    
    
    @IBAction func onTapGesture(_ sender: UITapGestureRecognizer) {
        
        let vc = (parent as! ViewController)
        vc.leadingConstrainMovingBar.constant = (-1 * vc.movingBarWidth.constant)
        vc.leadingConstrainContainer.constant = (-1 * vc.containerWidth.constant)
        vc.leadingConstrainTube.constant = (-1 * vc.tubeWidth.constant)
        
        UIView.animate(withDuration: 0.5){
            vc.view.layoutIfNeeded()
        }
        
        
    }
    
    @IBAction func onPanSwipe(_ sender: UIGestureRecognizer) {
        let vc = parent as! ViewController
        let location = sender.location(in: vc.view )
        
        
        
        switch sender.state {
        case .began:
            originalX = location.x
            
        case .ended:
            if vc.leadingConstrainMovingBar.constant > 0{
                vc.leadingConstrainMovingBar.constant = 0
            }else if vc.leadingConstrainMovingBar.constant < 0 {
                vc.leadingConstrainMovingBar.constant = (-1 * vc.movingBarWidth.constant)
                
            }
            
            
            if vc.leadingConstrainContainer.constant > 0{
                vc.leadingConstrainContainer.constant = vc.containerWidth.constant - vc.movingBarWidth.constant
            }else if vc.leadingConstrainContainer.constant < 0 {
                vc.leadingConstrainContainer.constant = (-1 * vc.containerWidth.constant)
                vc.leadingConstrainTube.constant = (-1 * vc.tubeWidth.constant)
            }
            
//            if vc.leadingConstrainTube.constant < 0 {
//                vc.leadingConstrainTube.constant = (-1 * vc.tubeWidth.constant)
//            }
            
            UIView.animate(withDuration: 0.5){
                vc.view.layoutIfNeeded()
            }
            
            
        case .changed:
            let movingQuantity = location.x - originalX
//            print(movingQuantity)
            if movingQuantity > 0 {
                vc.leadingConstrainMovingBar.constant = 0
            }else{
                vc.leadingConstrainMovingBar.constant = 0 + movingQuantity
            }
//
            vc.leadingConstrainContainer.constant = 0 + movingQuantity
            print(vc.leadingConstrainContainer.constant)
            

//            if movingQuantity < 0{
//
//                vc.leadingConstrainTube.constant = 0 + movingQuantity
//            }
//            print(vc.leadingConstrainTube.constant)
//            UIView.animate(withDuration: 0.5){
//                vc.view.layoutIfNeeded()
//            }
            
        default:
            break
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
