//
//  ViewController.swift
//  20180521_1
//
//  Created by user on 2018/5/21.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    
    @IBAction func ontab2(_ sender: Any) {
        
        print("AAABA")
        let url = URL(string: "https://goo.gl/maps/htKTFHYrwTy")
        let vc = SFSafariViewController(url:url!)
        showDetailViewController(vc, sender: self)
    }
    
    
    @IBAction func onTab(_ sender: Any) {
        print("AAAB")
        let url = URL(string: "https://goo.gl/maps/pzkBrUmxSNm")
        let vc = SFSafariViewController(url:url!)
        showDetailViewController(vc, sender: self)
        //        show(vc, sender: self)
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

