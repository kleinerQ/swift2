//
//  ViewController.swift
//  20180530_2_starbucks
//
//  Created by user on 2018/5/30.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIGestureRecognizerDelegate{
    @IBOutlet weak var leadingLeft: NSLayoutConstraint!
    
    @IBAction func edgeGesture(_ sender: UIScreenEdgePanGestureRecognizer) {
        let location = sender.location(in: view)
        print(location)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

