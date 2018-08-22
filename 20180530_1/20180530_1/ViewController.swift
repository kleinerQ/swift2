//
//  ViewController.swift
//  20180530_1
//
//  Created by user on 2018/5/30.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var leadingEdgeGrayConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var leadingEdgeConstraint: NSLayoutConstraint!
    
    @IBAction func onTapClose(_ sender: UITapGestureRecognizer) {
        leadingEdgeGrayConstraint.constant = -300
        leadingEdgeConstraint.constant = -240
        UIView.animate(withDuration: 0.5){
            self.view.layoutIfNeeded()
        }
        
    }
    
    var originalX:CGFloat! = 0
    

    @IBAction func edgeSwipe(_ sender: UIGestureRecognizer) {
        
        let location = sender.location(in: view)
//        print(location)
        switch sender.state {
        case .began:
            originalX = location.x
            
        case .ended:
            
            
            if leadingEdgeConstraint.constant > -240{
                leadingEdgeConstraint.constant = 0
                UIView.animate(withDuration: 0.5){
                    self.view.layoutIfNeeded()
                }
                
            }
//            print(leadingBackgrounGrey.constant)
            if leadingEdgeGrayConstraint.constant > -300{
                leadingEdgeGrayConstraint.constant = 0
                UIView.animate(withDuration: 0.5){
                    self.view.layoutIfNeeded()
                }
                
            }
            
            
            print(leadingEdgeConstraint.constant)
            print(leadingEdgeGrayConstraint.constant)
            
        case .changed:
            
            
            leadingEdgeConstraint.constant = -240 + (min((location.x - originalX), 240))
            leadingEdgeGrayConstraint.constant = -300 + (min((location.x - originalX), 300))
//            print(leadingEdgeConstraint.constant)
//            print(leadingBackgrounGrey.constant)
//            print("AA")
            //            if leadingEdgeConstraint.constant > 0{
            //                leadingEdgeConstraint.constant = 0
            ////                UIView.animate(withDuration: 0.5){
            ////                    self.view.layoutIfNeeded()
            ////                }
            //            }else{
            //
            //                leadingEdgeConstraint.constant = -252 + location.x - originalX
        //            }
        default:
            break
        }
        
    }
    
    
    
    
    
    

//    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
//        leadingEdgeConstraint.constant = -252
//        UIView.animate(withDuration: 0.5){
//            self.view.layoutIfNeeded()
//        }
//    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

