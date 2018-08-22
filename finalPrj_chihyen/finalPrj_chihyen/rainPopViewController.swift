
//
//  rainPopViewController.swift
//  finalPrj_chihyen
//
//  Created by Yen on 2018/7/8.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class rainPopViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBAction func onClickRainLocation(_ sender: Any) {
        
                setRainLocaiton(locationString: String(rainLocationList[ rainLocationPicker.selectedRow(inComponent: 0)]))
    }
    
    let rainLocationList = ["北屯區","西屯區","北區","南屯區","西區","東區","中區","南區","和平區","大甲區","大安區","外埔區","后里區","清水區","東勢區","神岡區","龍井區","石岡區","豐原區","梧棲區","新社區","沙鹿區","大雅區","潭子區","大肚區","太平區","烏日區","大里區","霧峰區"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    @IBOutlet weak var rainLocationPicker: UIPickerView!
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return rainLocationList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return rainLocationList[row]
    }
    
    var jsonObject = NSDictionary()
    
    func setRainLocaiton(locationString:String){
        
        do{
            
            print(locationString)
            
            //http://opendata.cwb.gov.tw/api/v1/rest/datastore/F-D0047-073?Authorization=CWB-18293664-B670-406C-AF9F-3936163CB95C&locationName=南屯區&elementName=PoP12h
            //paste the above link and the browser would transform chinese into unicode like below
            let urlStringCombine = "http://opendata.cwb.gov.tw/api/v1/rest/datastore/F-D0047-073?Authorization=CWB-18293664-B670-406C-AF9F-3936163CB95C&elementName=PoP12h&locationName=" + locationString
            
            
            //print(gg)
            if let url = URL(string: urlStringCombine.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!){
                
                print(url)
                let data = try Data(contentsOf: url)
                self.jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! NSDictionary
                
                
                // catch json data
                let weatherInfo=((((((jsonObject["records"] as! NSDictionary)["locations"] as! NSArray)[0]) as! NSDictionary)["location"] as! NSArray)[0]) as! NSDictionary
                
                
                let weatherElement = (weatherInfo["weatherElement"] as! NSArray)[0] as! NSDictionary
                let weatherPopTimes = weatherElement["time"] as! NSArray
                let closestTimePop = weatherPopTimes[0] as! NSDictionary// the closest 6 hour of this location
                
                print(closestTimePop)
                let rainPop = (((closestTimePop ["elementValue"] as! NSArray)[0]) as! NSDictionary )["value"] as! String
                print(Int(rainPop))
                
                circleView.currentValue = CGFloat(Int(rainPop)!)
                circleView.currentValue = CGFloat(100)
                print(circleView.currentValue)
            
                circleView.addGreyLayerFlag = true

//
//                
//                //bgLayer.add(strokeEndAnimation(to: 10), forKey: nil)
//                
                
                circleView.viewDidAppear(true)
                
                
                
                let rainSignURL = "http://192.168.211.153/cgi-bin/rainPossibilityLedCellControl.cgi?rainPossibility="
                let showLEDUrl = URL(string: (rainSignURL + rainPop))
                DispatchQueue.global().async {
                    do{
                        //let _ = try String(contentsOf: showLEDUrl!)
                        
                    }catch{
                        
                        print("Read Pi Fail")
                    }
                    
                }
                
            }
        }catch{
            //print("BB")
            print(error)
        }
        
        
    }
    
    var circleView = CircleViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("AA")
        //print(self.view.subviews)
        
        
        for vc in (self.childViewControllers) {
            if vc.restorationIdentifier == "circleView" {
                print(vc)
                circleView = vc as! CircleViewController
                
                //print(circleView.currentValue)
                break
            }
        }
        
        print("BB")
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
