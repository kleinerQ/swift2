//
//  ViewController.swift
//  20180529_3
//
//  Created by user on 2018/5/29.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    let list = [["南港","台北","板橋","桃園","新竹","苗栗","台中","彰化","雲林","嘉義","台南","左營"],
                ["南港","台北","板橋","桃園","新竹","苗栗","台中","彰化","雲林","嘉義","台南","左營"]
    ]
    
    @IBAction func onComplete(_ sender: Any) {
        
        
        let picker = view.viewWithTag(100) as! UIPickerView
        let left = list[0][picker.selectedRow(inComponent: 0)]
        let right = list[1][picker.selectedRow(inComponent: 1)]


        (parent as! MainViewViewController).bottomConstraint.constant = -200
        UIView.animate(withDuration: 0.5){
            (self.parent as! MainViewViewController).view.layoutIfNeeded()
        }
        let cellLeft = (parent?.view.viewWithTag(200) as! UITableViewCell).viewWithTag(400) as! UILabel
        let cellRight = (parent?.view.viewWithTag(200) as! UITableViewCell).viewWithTag(500) as! UILabel
        

        //also can use restorationIdentifier
//        for p in (parent?.childViewControllers)!{
//            if p.restorationIdentifier == "up_vc"{
//                (p.view.viewWithTag(400) as! UILabel).text = left
//            }
//        }
//
        
        
        cellLeft.text = left
        cellRight.text = right

//        for vc in (parent as! MainViewViewController).childViewControllers {
//            if vc is UITableViewController {
//                (vc as! MyTableController).fromLabel.text = left
//                break
//            }
//        }
//        let v =  (parent as! MainViewViewController).titleItem.subviews.first?.viewWithTag(400)
//        if v is UILabel {
//            (v as! UILabel).text = left
//        }
        
        
    }
    
    
    @IBAction func onSwitch(_ sender: Any) {
        let picker = view.viewWithTag(100) as! UIPickerView
        let leftpick = picker.selectedRow(inComponent: 0)
        let rightpick = picker.selectedRow(inComponent: 1)
        picker.selectRow(rightpick, inComponent: 0, animated: true)
        picker.selectRow(leftpick, inComponent: 1, animated: true)
        
        //picker.selectedRow(leftpick,inComponent: 1,animated:true)
        
        
    }
    


    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return list.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        print(list[component].count)
        return list[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        print(list[component][row])
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("AA")
        let picker = view.viewWithTag(100) as! UIPickerView
        let left = list[0][picker.selectedRow(inComponent: 0)]
        let right = list[1][picker.selectedRow(inComponent: 1)]
        //print("左邊為\(left) 右邊為\(right)")
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

