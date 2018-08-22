//
//  PayTicketViewController.swift
//  201806_prj_1
//
//  Created by Yen on 2018/6/9.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit
import AVFoundation
class PayTicketViewController: UIViewController {

    let session = AVCaptureSession()
    let deviceInput = DeviceInput()
    
    
    @IBAction func frontBackToggle(_ sender: UISwitch) {
//        session.beginConfiguration()
//        session.removeInput(session.inputs.last!)
//        if sender.isOn{
//
//            session.addInput(deviceInput.backWildAngleCamera!)
//
//        }else{
//
//            session.addInput(deviceInput.frontWildAngleCamera!)
//
//        }
//
//        session.commitConfiguration()
        
    }
    
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        settingPreviewLayer()
//        session.addInput(deviceInput.backWildAngleCamera!)
//        session.startRunning()
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
