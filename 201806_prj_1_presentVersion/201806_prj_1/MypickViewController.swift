//
//  MypickViewController.swift
//  201806_prj_1
//
//  Created by Yen on 2018/6/5.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class MypickViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    
    @IBAction func onComplete(_ sender: UIButton) {
        
        let parentVc = parent as! ViewController
        
        let picker = view.viewWithTag(1000) as! UIPickerView
        let leftPickedValue = list[0][picker.selectedRow(inComponent: 0)]
        let rightPickedValue = list[1][picker.selectedRow(inComponent: 1)]
        
        
        
        parentVc.backgroundLayerBottomContraint.constant = -800
        parentVc.pickViewBottomConstraint.constant = -300
        UIView.animate(withDuration: 0.5){
            (self.parent as! ViewController).view.layoutIfNeeded()
        }
        
        let startLabel = parentVc.view.viewWithTag(2000)?.viewWithTag(100) as! UILabel
        let destLabel = parentVc.view.viewWithTag(2000)?.viewWithTag(200) as! UILabel
        startLabel.text = leftPickedValue
        destLabel.text = rightPickedValue
        (parent as! ViewController).tabBarController?.tabBar.isHidden = false
        
    }
    
    @IBAction func onStationSwitch(_ sender: UIButton) {
        
        let picker = view.viewWithTag(1000) as! UIPickerView
        let leftpicked = picker.selectedRow(inComponent: 0)
        let rightpicked = picker.selectedRow(inComponent: 1)
        picker.selectRow(rightpicked, inComponent: 0, animated: true)
        picker.selectRow(leftpicked, inComponent: 1, animated: true)
        
    }
    
    
    let list = [["南港","台北","板橋","桃園","新竹","苗栗","台中","彰化","雲林","嘉義","台南","左營"],
                ["南港","台北","板橋","桃園","新竹","苗栗","台中","彰化","雲林","嘉義","台南","左營"]
    ]
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[component][row]
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let picker = view.viewWithTag(1000) as! UIPickerView
        picker.selectRow(1, inComponent: 0, animated: false)
        picker.selectRow(11, inComponent: 1, animated: false)
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
