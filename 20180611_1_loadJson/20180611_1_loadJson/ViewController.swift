//
//  ViewController.swift
//  20180611_1_loadJson
//
//  Created by Yen on 2018/6/11.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var jsonObject: [[AnyHashable:Any]] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            if let url = URL(string: "http://oz.nthu.edu.tw/~u9533141/thsr.json"){
                let data = try Data(contentsOf: url)
                self.jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String:Any]]
//                print(jsonObject)
            }
        }catch{
            print(error)
        }
        
        let userDepTime = "10:50"
        let direction = 1
        let runningDay = "Tuesday"
        let originalId = "1070"
        let destId = "1047"
        
        let result = timeTableQuery(jsonObject: jsonObject, userDepTime: userDepTime, direction: direction, depId: originalId, destId: destId, runningDay: runningDay)

        for item in result{
            
            print(item)
        }
        


        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func timeTableQuery(jsonObject: [[AnyHashable:Any]], userDepTime: String, direction: Int,depId:String,destId:String,runningDay: String ) -> [(key:Date,value:String)] {
        
        var sortedResult : [Date:String] = [:]
        
        for train in jsonObject{
            
            
            
            
            let generalTimetable = train["GeneralTimetable"] as! [AnyHashable : Any]
            let generalTrainInfo = generalTimetable["GeneralTrainInfo"] as! [String: Any]
            let serviceDay = generalTimetable["ServiceDay"] as! [String: Int]
            let stopTimes = generalTimetable["StopTimes"] as! NSArray
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
                    
                }
                
                if stopInfo["StationID"] as! String == destId{
                    
                    destFoundFlag = true
                    arrTime = stopInfo["DepartureTime"] as! String
                }
                
                if originalFoundFlag,destFoundFlag {
                    //                    print(generalTrainInfo["TrainNo"])
                    
                    let formatter = DateFormatter()
                    formatter.dateFormat = "HH:mm"
                    
//                    print(NSTimeZone.local)
                    formatter.timeZone = TimeZone.current
                    
                    let depTimeDateType = formatter.date(from: depTime)
                    let userDepTimeDateType = formatter.date(from: userDepTime)
                    //                    print(userDepTimeDateType)
                    
                    if depTimeDateType?.compare(userDepTimeDateType!).rawValue as! Int > 0{
                        
                        sortedResult[depTimeDateType!] = generalTrainInfo["TrainNo"] as! String + "," + depTime + "," + arrTime
                        
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
        
        
        for item in orderedResult{

            print(type(of: item))
            print(item)

        }
        
        return orderedResult
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

