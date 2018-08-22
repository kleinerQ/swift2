//
//  MyBookingTableViewController.swift
//  201806_prj_1
//
//  Created by Yen on 2018/6/6.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit
import CoreLocation
class MyBookingTableViewController: UITableViewController,CLLocationManagerDelegate {
    
    
    @IBOutlet weak var roundTicketSegment: MySegmentedControl!
    
    
    @IBOutlet weak var seatPrefereanceSegmented: MySegmentedControl!
    
    var isCollapse:Bool = true
    var isCollapseDiscountCell:Bool = true
    
    @IBOutlet weak var uniLabel: UILabel!
    
    
    @IBOutlet weak var numberTicketCellHeightConstraint: NSLayoutConstraint!
    
    let lm = CLLocationManager()

    
    let gpsList = ["南港":"25.052639,121.603764",
                   "台北":"25.045981,121.526531",
                   "板橋":"25.019709,121.472915",
                   "桃園":"25.014226,121.216088",
                   "新竹":"24.809755,121.040587",
                   "苗栗":"24.606453,120.82781",
                   "台中":"24.1138,120.616112",
                   "彰化":"23.875424,120.577253",
                   "雲林":"23.738777,120.417013",
                   "嘉義":"23.461747,120.323899",
                   "台南":"22.927007,120.285267",
                   "左營":"22.688685,120.308651",]
    
    @IBOutlet weak var deptDateLabel: UILabel!
    
    @IBAction func onChoiceDiscountCar(_ sender: MySegmentedControl) {
        

        
    }
    
    @IBAction func onClickShowReturnDatePickView(_ sender: UITapGestureRecognizer) {
        
        var myDateTicketVC: MyDatePickViewController!
        
        for vc in (self.parent?.childViewControllers)! {
            if vc.restorationIdentifier == "datePickView" {
                myDateTicketVC = vc as! MyDatePickViewController
                break
            }
        }
        
        myDateTicketVC.dateTarget = 1
        myDateTicketVC.datePick.minimumDate = myDateTicketVC.dateTmpForDeptAndReturn
        let parentVC = (parent as! ViewController)
        parentVC.tabBarController?.tabBar.isHidden = true
        parentVC.backgroundLayerBottomContraint.constant = 0
        parentVC.datePickViewBottom.constant = -50
        UIView.animate(withDuration: 0.5){
            (self.parent as! ViewController).view.layoutIfNeeded()
        }
        
        
    }
    
    @IBAction func onClickShowNumberTicketPickView(_ sender: UITapGestureRecognizer) {
        
//        print("GGGASDf")
        let parentVC = (parent as! ViewController)
        parentVC.tabBarController?.tabBar.isHidden = true
        
        parentVC.ticketNumberPickViewBottomConstraint.constant = -50
        parentVC.backgroundLayerBottomContraint.constant = 0
        UIView.animate(withDuration: 0.5){
            (self.parent as! ViewController).view.layoutIfNeeded()
        }

        
        
        
    }
    
    @IBAction func onClickShowDatePickView(_ sender: UITapGestureRecognizer) {
        
        var myDateTicketVC: MyDatePickViewController!
        
        for vc in (self.parent?.childViewControllers)! {
            if vc.restorationIdentifier == "datePickView" {
                myDateTicketVC = vc as! MyDatePickViewController
                break
            }
        }
        
        myDateTicketVC.dateTarget = 0
        
        let parentVC = (parent as! ViewController)
        parentVC.tabBarController?.tabBar.isHidden = true
        parentVC.backgroundLayerBottomContraint.constant = 0
        parentVC.datePickViewBottom.constant = -50
        UIView.animate(withDuration: 0.5){
            (self.parent as! ViewController).view.layoutIfNeeded()
        }
        
        
    }
    

    @IBOutlet var bookingTableView: UITableView!
    
    @IBAction func onChoiceSeatPrefereance(_ sender: UISegmentedControl) {
        
        
        
        if sender.selectedSegmentIndex == 0{
            //無
            seatPrefereanceSegmented.setTitle("請選擇", forSegmentAt: 1)
//            seatPrefereanceSegmented.selectedSegmentIndex = 1
            
        }else{
           
            let parentVC = (parent as! ViewController)
            parentVC.seatPrefereancePickViewBottomConstraint.constant = -50
            parentVC.backgroundLayerBottomContraint.constant = 0
            parentVC.tabBarController?.tabBar.isHidden = true
//            print("HH")
            UIView.animate(withDuration: 0.5){
                parentVC.view.layoutIfNeeded()
            }
            
            
        }
        
        
        
    }
    
    
    @IBAction func onChoiceTicketType(_ sender: UISegmentedControl) {
        
       
        if sender.selectedSegmentIndex == 0{

            (self.view.viewWithTag(301) as! UILabel).text = "請選擇回程日期"
            isCollapse = true

        }else{
            isCollapse = false

        }
        
        bookingTableView.beginUpdates()
        bookingTableView.endUpdates()
        
    }
    
    

    
    
    
    @IBAction func onChoiceCarType(_ sender: UISegmentedControl) {
        
        var myNumberTicketVC: MyNumberTicketPickViewController!
        
        for vc in (self.parent?.childViewControllers)! {
            if vc.restorationIdentifier == "numberTicketView" {
                myNumberTicketVC = vc as! MyNumberTicketPickViewController
                break
            }
        }
//        let myNumberTicketVC = storyboard?.instantiateViewController(withIdentifier: "numberTicketView") as! MyNumberTicketPickViewController
        
        
        if sender.selectedSegmentIndex == 0{
            (view.viewWithTag(800) as! UILabel).isHidden = false
            //(view.viewWithTag(800) as! UILabel).text = "大學生"

            myNumberTicketVC.numberOfType = 5
            myNumberTicketVC.pickViewUniLabel.isHidden = false
            myNumberTicketVC.numberTicketPicker.reloadAllComponents()
                        numberTicketCellHeightConstraint.constant += uniLabel.frame.size.height
            bookingTableView.beginUpdates()
            bookingTableView.endUpdates()

            
        }else{

            myNumberTicketVC.numberOfType = 4
            myNumberTicketVC.numberTicketPicker.reloadAllComponents()
           
            myNumberTicketVC.pickViewUniLabel.isHidden = true
            (view.viewWithTag(800) as! UILabel).isHidden = true
            

            numberTicketCellHeightConstraint.constant -= uniLabel.frame.size.height
            bookingTableView.beginUpdates()
            bookingTableView.endUpdates()
            
        }

        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        print("BSDF")
        if indexPath.row == 2, isCollapse{
            return 0
        }
        
        if indexPath.row == 5, isCollapseDiscountCell{
            return 0
        }
        return UITableViewAutomaticDimension
    }
    
    @IBOutlet weak var date: UILabel!
    
    @IBAction func onClickShowPickView(_ sender: Any) {
        let parentVC = (parent as! ViewController)
        
        parentVC.tabBarController?.tabBar.isHidden = true
        parentVC.backgroundLayerBottomContraint.constant = 0
        parentVC.pickViewBottomConstraint.constant = -50
        UIView.animate(withDuration: 0.5){
            (self.parent as! ViewController).view.layoutIfNeeded()
        }
//        print("GGGG")
    }
    
    
    var closestStation = "台北"
    
    
    var gpsUserLocation = CLLocation()
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print("MMM")
        if let userLocation = locations.first{
         
            
            gpsUserLocation = userLocation
            var distanceMin:Double = 100000
            
//            print("緯度：\(userLocation.coordinate.latitude)")
//            print("經度：\(userLocation.coordinate.longitude)")
//            print("高度：\(userLocation.altitude)")
            
            for (stationName,stationGps) in gpsList{
                //            print("\(stationName)    \(stationLocation)")
                let station = stationName
                let stationLocation = (stationGps).split(separator: ",")
                
                let distanceTmp = sqrt( pow(Double(stationLocation[0])! - Double(userLocation.coordinate.latitude),2) + pow(Double(stationLocation[1])! - Double(userLocation.coordinate.longitude),2))
                if distanceTmp < distanceMin{
                    closestStation = station
                    distanceMin = distanceTmp
                    
                    
                }
            }
            
            
//            print(closestStation)
        }
        
        
        

        
        
    }
    
    
    func resetOriginalStaion(){
//        print("GHASD")
        (self.view.viewWithTag(100) as! UILabel).text = closestStation
    }


    
    override func viewDidAppear(_ animated: Bool) {
        
        let user = UserDefaults.standard
        
        if let orginalStation = user.object(forKey: "orginalStation") as! String?{
            
            
            (self.view.viewWithTag(100) as! UILabel).text = orginalStation
            (self.view.viewWithTag(200) as! UILabel).text = user.object(forKey: "destStation") as! String?
            
        }else{
            
            (self.view.viewWithTag(100) as! UILabel).text = "台北"
            (self.view.viewWithTag(200) as! UILabel).text = "左營"
        }
        
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let timeString = formatter.string(from: Date())
        date.text = timeString
        
        
        
        lm.requestWhenInUseAuthorization()
        lm.delegate = self
        lm.startUpdatingLocation()
        
        

        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setStationInfo(orginalStation: String, destStation: String){
        let user = UserDefaults.standard
        user.set(orginalStation,forKey: "orginalStation")
        user.set(destStation,forKey: "destStation")
        
    }


//    override func viewWillAppear(_ animated: Bool) {
//        let user = UserDefaults.standard
//
//        if let orginalStation = user.object(forKey: "orginalStation") as! String?{
//
//            (self.view.viewWithTag(100) as! UILabel).text = orginalStation
//            print(orginalStation)
//        }else{
//            (self.view.viewWithTag(100) as! UILabel).text = "台北"
//            //             (ViewController.viewWithTag(100) as!UILabel).text = "台北"
//        }
//    }
    override func viewDidDisappear(_ animated: Bool) {

        setStationInfo(orginalStation: (self.view.viewWithTag(100) as! UILabel).text!, destStation: (self.view.viewWithTag(200) as! UILabel).text!)
//        print("MMGG")
    }
    
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
