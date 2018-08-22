//
//  MySeatPrefereancePickViewController.swift
//  201806_prj_1
//
//  Created by Yen on 2018/6/13.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class MySeatPrefereancePickViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var seatPrefereancePickView: UIPickerView!
    let list = ["靠窗", "走道"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }

    @IBAction func onClickComplete(_ sender: UIButton) {
        
        let selectValueString = list[seatPrefereancePickView.selectedRow(inComponent: 0)]
        
        let parentVC = (parent as! ViewController)
        parentVC.seatPrefereancePickViewBottomConstraint.constant = -300
        parentVC.backgroundLayerBottomContraint.constant = -800
        parentVC.tabBarController?.tabBar.isHidden = false
        UIView.animate(withDuration: 0.5){
            parentVC.view.layoutIfNeeded()
        }
        
        var mybookingTableViewVC:  MyBookingTableViewController!
        
        for vc in (parent as! ViewController).childViewControllers{
            
            if vc.restorationIdentifier == "bookingTableView"{
                mybookingTableViewVC = vc as! MyBookingTableViewController
                
                break
                
            }
        }
        
        mybookingTableViewVC.seatPrefereanceSegmented.setTitle(selectValueString, forSegmentAt: 1)
    }
    
    
    @IBAction func onClickCancel(_ sender: UIButton) {
        
        let parentVC = (parent as! ViewController)
        
        parentVC.seatPrefereancePickViewBottomConstraint.constant = -300
        parentVC.backgroundLayerBottomContraint.constant = -800
        parentVC.tabBarController?.tabBar.isHidden = false
        UIView.animate(withDuration: 0.5){
            parentVC.view.layoutIfNeeded()
        }
        
        
        var mybookingTableViewVC:  MyBookingTableViewController!
        
        for vc in (parent as! ViewController).childViewControllers{
            
            if vc.restorationIdentifier == "bookingTableView"{
                mybookingTableViewVC = vc as! MyBookingTableViewController
                
                break
                
            }
        }
        
        mybookingTableViewVC.seatPrefereanceSegmented.selectedSegmentIndex = 0
        

        

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
