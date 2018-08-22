//
//  ViewController.swift
//  20180607_2_motiondetect
//
//  Created by Yen on 2018/6/7.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit
import CoreMotion
class ViewController: UIViewController {

    let pedometer = CMPedometer()
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var stepCounter: UILabel!
    @IBAction func onPickView(_ sender: Any) {
        datePicker.maximumDate = Date()
        print(datePicker.date)
    }
    
    @IBAction func onclick(_ sender: Any) {
        
        
        if CMPedometer.isStepCountingAvailable(){
            
            pedometer.queryPedometerData(from: datePicker.date, to: Date()) { (pedometerData, error) in
                if error != nil {
                    print("AA")
                    print(error!)
                    
                }else{
                    
                    self.stepCounter.text = pedometerData?.numberOfSteps as! String
                    print("BB")
                    print(pedometerData?.numberOfSteps)
                }
            }
            
        }else{
            
            print("CC")
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

