//
//  ViewController.swift
//  20180614_1_customAlert
//
//  Created by Yen on 2018/6/14.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func onclick(_ sender: Any) {
    
        let alert = storyboard?.instantiateViewController(withIdentifier: "myalert")
        present(alert!, animated: true){
            
            print("GG")
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

