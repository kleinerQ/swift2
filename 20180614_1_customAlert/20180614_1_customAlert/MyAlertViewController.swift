//
//  MyAlertViewController.swift
//  20180614_1_customAlert
//
//  Created by Yen on 2018/6/14.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class MyAlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        alertView.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var alertView: UIView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onDismiss(_ sender: Any) {
        
        let vc = presentingViewController as! ViewController
        dismiss(animated: true, completion: nil)
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
