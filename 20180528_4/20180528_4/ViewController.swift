//
//  ViewController.swift
//  20180528_4
//
//  Created by user on 2018/5/28.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func 完成後通知我(_ text:String?){

        if let text = text {
            print(text)
        }
    }
    
    @IBAction func onClick(_ sender: Any) {
        let alert = storyboard?.instantiateViewController(withIdentifier: "myalert")
        present(alert!, animated: true, completion: nil)
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

