//
//  MyAlert.swift
//  20180528_2
//
//  Created by user on 2018/5/28.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit

class MyAlert: UIViewController {

    @IBOutlet weak var pwd: UITextField!
    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var alertView: UIView!
    
    @IBAction func onDismiss(_ sender: Any) {

        
        let vc = presentingViewController as! ViewController
        
        vc.完成後請通知我(text.text,pwd.text)
        toggleControlEnabled(true)
        
        dismiss(animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        alertView.layer.cornerRadius = 10
        toggleControlEnabled(false)

        
        // Do any additional setup after loading the view.
    }
    
    private func toggleControlEnabled(_ flag: Bool){
        for v in (presentingViewController?.view.subviews)!{
            if v is UIControl{
                
                if v is UIButton, v.tag == 200{
                    continue
                }
                
                (v as! UIControl).isEnabled = flag
                
            }
        }
        
        
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
