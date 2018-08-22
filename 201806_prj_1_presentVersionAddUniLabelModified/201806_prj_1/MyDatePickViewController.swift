//
//  MyDatePickViewController.swift
//  201806_prj_1
//
//  Created by Yen on 2018/6/6.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class MyDatePickViewController: UIViewController {
    
    var timeString: String = ""
    var dateTarget = 0
    var dateTmpForDeptAndReturn = Date()
    @IBAction func onClickComplete(_ sender: UIButton) {
        
        
        var myBookingTableViewVC: MyBookingTableViewController!
        
        for vc in (self.parent?.childViewControllers)! {
            if vc.restorationIdentifier == "bookingTableView" {
                myBookingTableViewVC = vc as! MyBookingTableViewController
                
                break
            }
        }
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        timeString = formatter.string(from: datePick.date)
        
        let datePickDate = datePick.date
//        print(timeTest)
//        print(Date())
        //print(timeTest.compare(<#T##other: Date##Date#>))
        
//        let timeForCompare = Calendar.current.nextDate(after: Date().addingTimeInterval(<#T##timeInterval: TimeInterval##TimeInterval#>), matching:
//            .day , matchingPolicy: .day)
//        print(timeForCompare)
        
        let date1 = Calendar.current.startOfDay(for: Date())
        let date2 = Calendar.current.startOfDay(for: datePickDate)
        
        let dateDiff = Calendar.current.dateComponents([.day], from: date1, to: date2).day
        //print(components)
        
        //        print(Calendar.current.compare(datePick.date, to: Date(), toGranularity: .day))
        
        if dateTarget == 0{
        
            let headingDateLabel = myBookingTableViewVC.view.viewWithTag(300) as! UILabel
            headingDateLabel.text = timeString
        }else{
            let headingDateLabel = myBookingTableViewVC.view.viewWithTag(301) as! UILabel
            headingDateLabel.text = timeString
            
        }
        
        
        
        if dateDiff! >= 4{
            myBookingTableViewVC.isCollapseDiscountCell = false
            
        }else{
            
            myBookingTableViewVC.isCollapseDiscountCell = true
        }
        
        myBookingTableViewVC.tableView.beginUpdates()
        myBookingTableViewVC.tableView.endUpdates()
        
        
        let parentVc = parent as! ViewController

        parentVc.backgroundLayerBottomContraint.constant = -800
        parentVc.datePickViewBottom.constant = -300
        UIView.animate(withDuration: 0.5){
            (self.parent as! ViewController).view.layoutIfNeeded()
            
        }
        
        (self.parent as! ViewController).tabBarController?.tabBar.isHidden = false
        
                //print(timeString)
        dateTmpForDeptAndReturn = datePick.date.addingTimeInterval(60*10)
    }
    
    
    @IBAction func onClickTodayBtn(_ sender: UIButton) {
        datePick.setDate(Date(), animated: true)
        
    }
    
    
    @IBOutlet weak var datePick: UIDatePicker!
    @IBAction func onValueChange(_ sender: UIDatePicker) {
        datePick.minimumDate = Date()


//        print(timeString)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        timeString = formatter.string(from: Date())
        // Do any additional setup after loading the view.
        datePick.backgroundColor = UIColor.white
        
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
