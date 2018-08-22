//
//  ViewController.swift
//  20180523_2
//
//  Created by user on 2018/5/23.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var height: UITextField!
   
    @IBOutlet weak var weight: UITextField!
    
    @IBOutlet weak var suggestion: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBAction func onclick(_ sender: Any) {
        

            let weinum = Float(weight.text!)
            let heinum = Float(height.text!)
            suggestion.text = ""
            if(weinum == nil || heinum == nil){
                label.text = "輸入錯誤!!"
                
            }else if(weinum == 0 || heinum == 0){
                label.text = "身高或體重不能為零!!"
        
            }else{

                let bmiResult = weinum! / (heinum!/100 * heinum!/100)
                label.text = "BMI值 : \(bmiResult)"
                if (bmiResult>25){
                    suggestion.text = "建議：體重過重"
                }else if bmiResult<18.5 {
                    suggestion.text = "建議：體重過輕"
                    
                }else{
                    suggestion.text = "建議：體重正常"
                    
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

