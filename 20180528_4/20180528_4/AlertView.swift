//
//  AlertView.swift
//  20180528_4
//
//  Created by user on 2018/5/28.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit

class AlertView: UIViewController {


    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var alertView: UIView!
    @IBAction func onDismiss(_ sender: Any) {
        let vc = presentingViewController as! ViewController
        vc.完成後通知我(text.text!)
        dismiss(animated: true, completion: nil)
        toggleBtnEnable(true)
        
    }
    
    private func toggleBtnEnable(_ flag:Bool){
        for v in (presentingViewController?.view.subviews)!{
            if v is UIControl{
                
                if v is UIButton,v.tag == 300{
                    continue
                }
                
                (v as! UIControl).isEnabled = flag
                
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertView.layer.cornerRadius = 20

        toggleBtnEnable(false)
        // Do any additional setup after loading the view.
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
