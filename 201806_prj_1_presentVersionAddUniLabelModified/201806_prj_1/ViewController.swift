//
//  ViewController.swift
//  201806_prj_1
//
//  Created by Yen on 2018/6/4.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var bookingUserInfoViewRightConstraint: NSLayoutConstraint!
    @IBOutlet weak var seatPrefereancePickViewBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var returnTimeQueryRightConstraint: NSLayoutConstraint!
    @IBAction func onClickNavigation(_ sender: Any) {
        
        
        var myBookingTableViewVC: MyBookingTableViewController!
        
        for vc in (self.childViewControllers) {
            if vc.restorationIdentifier == "bookingTableView" {
                myBookingTableViewVC = vc as! MyBookingTableViewController
                break
            }
        }
        
        let currentGpsLocation = myBookingTableViewVC.gpsUserLocation
        let currentStaion = ((myBookingTableViewVC.view.viewWithTag(100) as! UILabel).text!)
//        print(currentStaion)
//        print(myBookingTableViewVC.gpsList)
        let stationLocation = (myBookingTableViewVC.gpsList[currentStaion]! ).split(separator: ",")
        
        
        let startPoint = CLLocationCoordinate2D(latitude: currentGpsLocation.coordinate.latitude, longitude: currentGpsLocation.coordinate.longitude)
        let destStation = CLLocationCoordinate2D(latitude: Double(stationLocation[0])!, longitude: Double(stationLocation[1])!)

        let pA = MKPlacemark(coordinate: startPoint, addressDictionary: nil)
        let pB = MKPlacemark(coordinate: destStation, addressDictionary: nil)


        let miA = MKMapItem(placemark: pA)
        let miB = MKMapItem(placemark: pB)
        miA.name = "起點"
        miB.name = "\(currentStaion)高鐵站"

        let routes = [miA,miB]

        let options = [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving]
        MKMapItem.openMaps(with: routes, launchOptions: options)
        
        
    }
    @IBOutlet weak var timeTableQueryRightConstraint: NSLayoutConstraint!
    
    var jsonObject: [[AnyHashable:Any]] = []
    
    func transferStationNameToId(stationName:String)->String{
        
        let list = ["南港":"0990","台北": "1000","板橋":"1010","桃園":"1020","新竹":"1030","苗栗":"1035","台中":"1040","彰化":"1043","雲林":"1047","嘉義":"1050","台南":"1060","左營":"1070"]
        var stationId = ""
        for (key,value) in list{
            if key == stationName{
                stationId = value
                break
            }
        }
        
        
        
        
        return stationId
        
        
    }


    
    
    @IBAction func onClickTicketQuery(_ sender: Any) {
//        print("BBBsdf")
        
        
        let userQueryDepStationString = (self.view.viewWithTag(2000)?.viewWithTag(100) as! UILabel).text
        
        let userQueryDestStationString = (self.view.viewWithTag(2000)?.viewWithTag(200) as! UILabel).text
        
        
        if userQueryDepStationString == userQueryDestStationString{
            
            
            let alert = storyboard?.instantiateViewController(withIdentifier: "sameStationAlert")
            present(alert!,animated: true, completion: nil)
            
            
        }else{
            
            
            let userQueryTimeString = (self.view.viewWithTag(2000)?.viewWithTag(300) as! UILabel).text
            let queryString = userQueryTimeString?.split(separator: " ")
            let queryTime = String(queryString![1])
            let queryWeekDay = String(queryString![0])
            
            
            
            let userQueryTimeReturnString = (self.view.viewWithTag(2000)?.viewWithTag(301) as! UILabel).text
            
            
            
            
            
            
            
            
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd"
            let queryWeekDayDateType = formatter.date(from: queryWeekDay)
            let modifiedqueryWeekDayDateType = queryWeekDayDateType?.addingTimeInterval(TimeInterval(3600 * 8))
            let weekdayList = ["OnlyForShift","Sunday","Monday","TuesDay","Wednesday","Thursday","Friday","Saturday"]
            let weekdayIndex = Calendar.current.component(.weekday, from: modifiedqueryWeekDayDateType!)
            let runningDay = weekdayList[weekdayIndex]
            
            
            
            
            
            
            
            
            //        print(runningDay)
            let depId = transferStationNameToId(stationName: userQueryDepStationString!)
            let destId = transferStationNameToId(stationName: userQueryDestStationString!)
            //        print(jsonObject)
            
            
            var direction = 1
            
            if Int(depId)! > Int(destId)!{
                //            print("北上")
                direction = 1
            }else{
                //            print("難")
                direction = 0
            }
            
            
            let printList = timeTableQuery(jsonObject: jsonObject, userDepTime: queryTime, direction: direction, depId: depId, destId: destId, runningDay: runningDay)
            
            
            var myTimeTableQueryVC: MyTimeTableQueryViewController!
            var myTimeTableQueryVC2: MyTimeTableQueryViewController!
            
            for vc in (self.childViewControllers) {
                if vc.restorationIdentifier == "myTimeTableQueryVC" {
                    myTimeTableQueryVC = vc as! MyTimeTableQueryViewController
                    myTimeTableQueryVC.list = printList
                    myTimeTableQueryVC.queryResetData()
                    
                }
                
                if vc.restorationIdentifier == "myTimeTableQueryVC2" {
                    myTimeTableQueryVC2 = vc as! MyTimeTableQueryViewController

                    
                }
                
                
            }
            
            
            
            if userQueryTimeReturnString != "請選擇回程日期"{
                
                
                let queryReturnString = userQueryTimeReturnString?.split(separator: " ")
                let queryReturnTime = String(queryReturnString![1])
                let queryReturnWeekDay = String(queryReturnString![0])
//                print(queryReturnTime)
                
                
                let queryWeekDayReturnDateType = formatter.date(from: queryReturnWeekDay)
                let modifiedqueryWeekDayReturnDateType = queryWeekDayReturnDateType?.addingTimeInterval(TimeInterval(3600 * 8))
                
                let weekdayReturnIndex = Calendar.current.component(.weekday, from: modifiedqueryWeekDayReturnDateType!)
                let runningDayReturn = weekdayList[weekdayReturnIndex]
                
                let printListReturn = timeTableQuery(jsonObject: jsonObject, userDepTime: queryReturnTime, direction: abs(direction - 1), depId: destId, destId: depId, runningDay: runningDayReturn)
                
                myTimeTableQueryVC2.list = printListReturn
                myTimeTableQueryVC2.queryResetData()
                self.returnTimeQueryRightConstraint.constant = 0
                
                
                (myTimeTableQueryVC2.view.viewWithTag(1000) as!UILabel).text =  queryReturnWeekDay + "回程"
            }
            
        
            let ticketTypeSegment = self.view.viewWithTag(2000)?.viewWithTag(10000) as! UISegmentedControl
            if ticketTypeSegment.selectedSegmentIndex == 0{
                
                (myTimeTableQueryVC.view.viewWithTag(1000) as!UILabel).text = queryWeekDay + " 單程"
                
            }else{
                
                
                (myTimeTableQueryVC.view.viewWithTag(1000) as!UILabel).text = queryWeekDay + " 去程"
                
            }
            
            
            
            self.timeTableQueryRightConstraint.constant = 0
            self.bookingUserInfoViewRightConstraint.constant = 0 
            //        print("GSDAF")
            
            //        print(user)
            (myTimeTableQueryVC.view.viewWithTag(10) as! UILabel).text = userQueryDepStationString
            (myTimeTableQueryVC.view.viewWithTag(20) as! UILabel).text = userQueryDestStationString
            (myTimeTableQueryVC2.view.viewWithTag(20) as! UILabel).text = userQueryDepStationString
            (myTimeTableQueryVC2.view.viewWithTag(10) as! UILabel).text = userQueryDestStationString
            //        UIView.animate(withDuration: 0.5){
            //            self.view.layoutIfNeeded()
            //
            //        }
            
            
            
            //        for item in printResult {
            //
            //            print(item)
            //        }
            
            //        print(originalId)
            //        print(destId)
            
            
        }
        
        
        
        
    }
    
    func reLoadTicketQuery(nowTimeString:String,shiftHour:Int,runningDay:String, returnFlag:Bool) -> String{

        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        //                    print(NSTimeZone.local)
        formatter.timeZone = TimeZone.current
        //dep time found
        
        
        
        
        
        let nowTimeDateType = formatter.date(from: nowTimeString)
        var modifiedQueryTimeDateType = nowTimeDateType?.addingTimeInterval(TimeInterval(3600 * shiftHour))

        
        
        
        let compareTimeString = "00:00"
        let compareTimeDataType = formatter.date(from: compareTimeString)
        
        
        let compareTimeString2 = "23:59"
        let compareTime2DataType = formatter.date(from: compareTimeString2)
        
        if (modifiedQueryTimeDateType?.compare(compareTimeDataType!).rawValue as! Int) < 0 || (modifiedQueryTimeDateType?.compare(compareTime2DataType!).rawValue as! Int) > 0{
//            print(modifiedQueryTimeDateType)
            modifiedQueryTimeDateType = modifiedQueryTimeDateType?.addingTimeInterval(TimeInterval(-3600 * shiftHour))
        
        }
        let modifiedtimeString = formatter.string(from: modifiedQueryTimeDateType!)
        let queryTime = modifiedtimeString
        
//        print(modifiedtimeString)
        
        let userQueryDepStationString = (self.view.viewWithTag(2000)?.viewWithTag(100) as! UILabel).text
        
        let userQueryDestStationString = (self.view.viewWithTag(2000)?.viewWithTag(200) as! UILabel).text
        
        

        
        
        let runningDay = runningDay
        var depId = transferStationNameToId(stationName: userQueryDepStationString!)
        var destId = transferStationNameToId(stationName: userQueryDestStationString!)
        //        print(jsonObject)
        
        
        
        
        var direction = 1
        
        if Int(depId)! > Int(destId)!{
            //            print("北上")
            direction = 1
        }else{
            //            print("難")
            direction = 0
        }
        
        if returnFlag == true{
            let tmp = depId
            depId = destId
            destId = tmp
            direction = abs(direction-1)
            
        }
        
        
        
        let printList = timeTableQuery(jsonObject: jsonObject, userDepTime: queryTime, direction: direction, depId: depId, destId: destId, runningDay: runningDay)
        
        
        
        
        var myTimeTableQueryVC: MyTimeTableQueryViewController!
        var myTimeTableQueryVC2: MyTimeTableQueryViewController!
        
        
        for vc in (self.childViewControllers) {
//            print(vc)
            if vc.restorationIdentifier == "myTimeTableQueryVC" {
                myTimeTableQueryVC = vc as! MyTimeTableQueryViewController

//                print("MMM")
                
            }
            
            if vc.restorationIdentifier == "myTimeTableQueryVC2" {
                myTimeTableQueryVC2 = vc as! MyTimeTableQueryViewController

//                print("NNN")
            }
        }
        
        if returnFlag == true {
            myTimeTableQueryVC2.list = printList
            myTimeTableQueryVC2.queryResetData()
            
        }else{
            myTimeTableQueryVC.list = printList
            myTimeTableQueryVC.queryResetData()
            
        }
        
        
//        self.timeTableQueryRightConstraint.constant = 0
//        self.returnTimeQueryRightConstraint.constant = 0
//        (myTimeTableQueryVC.view.viewWithTag(10) as! UILabel).text = userQueryDepStationString
//        (myTimeTableQueryVC.view.viewWithTag(20) as! UILabel).text = userQueryDestStationString
//        (myTimeTableQueryVC2.view.viewWithTag(20) as! UILabel).text = userQueryDepStationString
//        (myTimeTableQueryVC2.view.viewWithTag(10) as! UILabel).text = userQueryDestStationString
        
        UIView.animate(withDuration: 0.5){
            self.view.layoutIfNeeded()
            
        }
        
        return modifiedtimeString
        
        
        
    }
    
    
    
    
    var originalX:CGFloat! = 0
    
    @IBAction func onPanEdgeGestureCamera(_ sender: UIScreenEdgePanGestureRecognizer) {
        
//        let location = sender.location(in: view)
//        let camVCWidth = self.view.frame.size.width
//        print(camVCWidth)
//        //        print(location)
//
//        //        print(tubeWidth)
//        //        print(containerWidth)
//        //        print(movingBarWidth)
//
//        switch sender.state {
//        case .began:
//            originalX = location.x
//
//        case .ended:
//            print(camVcLeftContraint.constant)
//            if camVcLeftContraint.constant > 0{
//                camVcLeftContraint.constant = 0
//            }else if camVcLeftContraint.constant > (-1 * camVCWidth){
//                camVcLeftContraint.constant = 0
//            }
//
//
//            UIView.animate(withDuration: 0.5){
//                self.view.layoutIfNeeded()
//            }
//
//
//        case .changed:
//            let movingQuantity = location.x - originalX
//            if movingQuantity + ((-1) * camVCWidth) > 0 {
//                camVcLeftContraint.constant = 0
//            }else{
//                camVcLeftContraint.constant = -1 * camVCWidth + movingQuantity
//            }
//
//
//            UIView.animate(withDuration: 0.5){
//                self.view.layoutIfNeeded()
//            }
//
//        default:
//            break
//        }
        
        
    }
    
    
    @IBOutlet weak var camVcLeftContraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var backgroundLayerBottomContraint: NSLayoutConstraint!
    @IBOutlet weak var datePickViewBottom: NSLayoutConstraint!
    @IBOutlet weak var ticketNumberPickViewBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var pickViewBottomConstraint: NSLayoutConstraint!
    
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
//        print("GGGADF")
        
        var mybookingTableViewVC: MyBookingTableViewController!
        for vc in (self.childViewControllers) {
            if vc.restorationIdentifier == "bookingTableView" {
                mybookingTableViewVC = vc as! MyBookingTableViewController
                break
            }
        }
        mybookingTableViewVC.resetOriginalStaion()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do{
            //print("AA")
            if let url = URL(string: "http://oz.nthu.edu.tw/~u9533141/thsr.json"){
                let data = try Data(contentsOf: url)
                self.jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String:Any]]
                //                print(jsonObject)
            }
        }catch{
            //print("BB")
            print(error)
        }
        
        

    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    
    func timeTableQuery(jsonObject: [[AnyHashable:Any]], userDepTime: String, direction: Int,depId:String,destId:String,runningDay: String ) -> [(key:Date,value:String)] {
        
        var sortedResult : [Date:String] = [:]
        
        for train in jsonObject{
            
            
            
            
            let generalTimetable = train["GeneralTimetable"] as! [AnyHashable : Any]
            let generalTrainInfo = generalTimetable["GeneralTrainInfo"] as! [String: Any]
            let serviceDay = generalTimetable["ServiceDay"] as! [String: Int]
            let stopTimes = generalTimetable["StopTimes"] as! NSArray
//            print(serviceDay)
            //let stopInfo = stopTimes[0] as! [String:Any]
            
            //check direction
            if (generalTrainInfo["Direction"] as! Int) != direction{
                continue
            }
            
            //check serviceDay
            
            if serviceDay[runningDay] == 0{
                continue
            }
            
            
            
            
            var originalFoundFlag:Bool = false
            var destFoundFlag:Bool = false
            
            var depTime:String = ""
            var arrTime:String = ""
            
            for eachStop in stopTimes{
                //                print(eachStop)
                let stopInfo = eachStop as! [String:Any]
                if stopInfo["StationID"] as! String == depId{
                    originalFoundFlag = true
                    depTime = stopInfo["DepartureTime"] as! String
//                    print(depTime)
                    
                }
                
                if stopInfo["StationID"] as! String == destId{
                    
                    destFoundFlag = true
                    arrTime = stopInfo["DepartureTime"] as! String
//                    print(arrTime)
                }
                
                if originalFoundFlag,destFoundFlag {
                    //                    print(generalTrainInfo["TrainNo"])
                    
                    let formatter = DateFormatter()
                    formatter.dateFormat = "HH:mm"
                    
                    //                    print(NSTimeZone.local)
                    formatter.timeZone = TimeZone.current
                    //dep time found
                    let depTimeDateType = formatter.date(from: depTime)
                    let arrTimeDateType = formatter.date(from: arrTime)
                    //dep time user input
                    let userDepTimeDateType = formatter.date(from: userDepTime)
                    

                    
                    
                    
                    
                    
                    if depTimeDateType?.compare(userDepTimeDateType!).rawValue as! Int > 0{
                        
                        
                        var interval = Int((arrTimeDateType?.timeIntervalSince(depTimeDateType!))!)
                        if interval < 0 {
                            interval = interval + 86400
                        }
                        let (h,m) = secondsToHoursMinutesSeconds(seconds: interval)
                        
                        
                        
                        if m < 10{
                            sortedResult[depTimeDateType!] = generalTrainInfo["TrainNo"] as! String + "," + depTime + "," + arrTime + "," + "\(h):0\(m)"
                        }else{
                            sortedResult[depTimeDateType!] = generalTrainInfo["TrainNo"] as! String + "," + depTime + "," + arrTime + "," + "\(h):\(m)"
                        }
                        
                    }
                    //                    if ((depTimeDateType?.compare(userDepTimeDateType!))){
                    //
                    //                        list[depTimeDateType!] = generalTrainInfo["TrainNo"] as! String + "," + depTime as! String + "," + arrTime as! String
                    //                    }
                    
                    
                    //                    print(depTime)
                    //                    print(arrTime)
                    //                    print(generalTrainInfo["Direction"])
                    //                    print(serviceDay)
                    break
                }
                
                
            }
            
            //            print(stopInfo["DepartureTime"])
            //            print(stopInfo["StationID"])
            
        }
        
        let orderedResult = sortedResult.sorted{ (d1,d2) -> Bool in
            
            return  d1.key < d2.key
            
        }
        
//
//        for item in orderedResult{
//
//            print(type(of: item))
//            print(item)
//
//        }
//
        return orderedResult
        
    }
    
    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60)
    }
}

