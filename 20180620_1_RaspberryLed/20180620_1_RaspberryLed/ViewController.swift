//
//  ViewController.swift
//  20180620_1_RaspberryLed
//
//  Created by Yen on 2018/6/20.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let ledURL = "http://10.2.1.108/cgi-bin/ledForCellControll.cgi?pin=14&isOn="
    
    @IBAction func onChanged(_ sender: UISwitch) {
        
        
        let url = URL(string:(ledURL + ((sender.isOn) ? "1" : "0")))
        //let url = URL(string: ledURL)
        
        
        
        //for UX, user need not to wait the internet response
        DispatchQueue.global().async {
            let _ = try! String(contentsOf: url!)
        }
        
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

