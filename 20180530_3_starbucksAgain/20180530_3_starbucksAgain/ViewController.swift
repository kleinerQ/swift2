//
//  ViewController.swift
//  20180530_3_starbucksAgain
//
//  Created by user on 2018/5/30.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIGestureRecognizerDelegate {
    
    @IBAction func onTapClick(_ sender: UITapGestureRecognizer) {
        print("OnTap")
    }
    
    
    @IBOutlet weak var tubeWidth: NSLayoutConstraint!
    @IBOutlet weak var containerWidth: NSLayoutConstraint!
    
    @IBOutlet weak var movingBarWidth: NSLayoutConstraint!
    var originalX:CGFloat! = 0
    
    @IBAction func edgeGuesture(_ sender: UIScreenEdgePanGestureRecognizer) {
        let location = sender.location(in: view)
//        print(location)
        
//        print(tubeWidth)
//        print(containerWidth)
//        print(movingBarWidth)
        switch sender.state {
        case .began:
            originalX = location.x
            
        case .ended:
            if leadingConstrainMovingBar.constant > 0{
                leadingConstrainMovingBar.constant = 0
            }else if leadingConstrainMovingBar.constant > (-1 * movingBarWidth.constant){
                leadingConstrainMovingBar.constant = 0
            }
            
            if leadingConstrainContainer.constant > (-1 * containerWidth.constant){
                leadingConstrainContainer.constant = containerWidth.constant - movingBarWidth.constant
            }

            if leadingConstrainTube.constant > ( -1 * tubeWidth.constant){
                leadingConstrainTube.constant = 0
            }

            UIView.animate(withDuration: 0.5){
                self.view.layoutIfNeeded()
            }
            
        
        case .changed:
            let movingQuantity = location.x - originalX
            if movingQuantity + ((-1) * movingBarWidth.constant) > 0 {
                leadingConstrainMovingBar.constant = 0
            }else{
                leadingConstrainMovingBar.constant = -1 * movingBarWidth.constant + movingQuantity
            }
            
            leadingConstrainContainer.constant = -1 * containerWidth.constant + movingQuantity
            leadingConstrainTube.constant = -1 * tubeWidth.constant + movingQuantity
            UIView.animate(withDuration: 0.5){
                self.view.layoutIfNeeded()
            }
            
        default:
            break
        }
        
    }
    
    @IBOutlet weak var leadingConstrainTube: NSLayoutConstraint!
    
    
    @IBOutlet weak var leadingConstrainContainer: NSLayoutConstraint!
    
    @IBOutlet weak var leadingConstrainMovingBar: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

