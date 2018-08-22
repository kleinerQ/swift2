//
//  ViewController.swift
//  2018.06.22_1
//
//  Created by admin on 2018/6/22.
//  Copyright © 2018年 Simon Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var degree = 90
    var stopFlag = false
    let cgiURL = "http://192.168.211.146/cgi-bin/SG90.cgi?pwm=50&degree="

    @IBAction func leftTouchDown(_ sender: Any) {
        stopFlag = false
        DispatchQueue.global().async {
            while !self.stopFlag {
                if self.degree < 180 {
                    print("\(self.degree)")
                    DispatchQueue.global().async {
                        let url = URL(string: self.cgiURL + "\(self.degree)")
                        let _ = try! String(contentsOf: url!)
                    }
                        self.degree += 5
                }
                Thread.sleep(forTimeInterval: 0.1)
            }
        }
    }
    
    @IBAction func leftTouchUpInside(_ sender: Any) {
        stopFlag = true
    }
    @IBAction func rightTouchDown(_ sender: Any) {
        stopFlag = false
        DispatchQueue.global().async {
            while !self.stopFlag {
                if self.degree > 0 {
                    print("\(self.degree)")
                    DispatchQueue.global().async {
                        let url = URL(string: self.cgiURL + "\(self.degree)")
                        let _ = try! String(contentsOf: url!)
                    }
                        self.degree -= 5
                }
                Thread.sleep(forTimeInterval: 0.1)
            }
        }
    }
    
    @IBAction func rightTouchUpInside(_ sender: Any) {
        stopFlag = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = URL(string: cgiURL + "90")
        let _ = try! String(contentsOf: url!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

