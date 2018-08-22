//
//  ViewController.swift
//  20180622_1_towerProControl
//
//  Created by Yen on 2018/6/22.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    


    

    let towerControlURL = "http://192.168.211.153/cgi-bin/towerProControl.cgi?degree="
    var degree = 0
    @IBAction func onIncrease(_ sender: Any) {
        
        degree += 10
//        print(degree)
        if degree >= 0, degree <= 180{
            
            let url = URL(string:(towerControlURL + String(degree)))
            print(url)
            DispatchQueue.global().async {
                let _ = try! String(contentsOf: url!)
            }
            
            
        }else{
            degree = 180
            let alert = UIAlertController(title: nil, message: "角度已到極限", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
            
        }
        
        
    }
    
    @IBAction func onDecrease(_ sender: Any) {
        
        degree -= 10
//        print(degree)
        if degree >= 0, degree <= 180{
            
            let url = URL(string:(towerControlURL + String(degree)))
            print(url)
            DispatchQueue.global().async {
                let _ = try! String(contentsOf: url!)
            }
            
            
        }else{
            degree = 0
            let alert = UIAlertController(title: nil, message: "角度已到極限", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
            
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

