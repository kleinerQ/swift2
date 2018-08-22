//
//  ViewController.swift
//  20180524_app1
//
//  Created by KoKang Chu on 2018/5/24.
//  Copyright © 2018年 KoKang Chu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let app = UIApplication.shared.delegate as! AppDelegate
    var jsonObject: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        jsonObject = app.uviData.getJsonObject()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonObject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // indexPath.section
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        // 舊的寫法
//        var tmpCell = tableView.dequeueReusableCell(withIdentifier: "Cell")
//
//        if tmpCell == nil {
//            tmpCell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
//        }
        
        let item = jsonObject[indexPath.row]
        var county: String = "未知"
        var siteName: String = "未知"
        var uvi: String = "未知"
        
        cell.backgroundColor = .white
        cell.imageView?.image = nil
        cell.textLabel?.textColor = .black
        cell.detailTextLabel?.textColor = cell.textLabel?.textColor
        
        if item["County"] is String {
            county = item["County"] as! String
        }
        if item["SiteName"] is String {
            siteName = item["SiteName"] as! String
        }
        if item["UVI"] is String {
            uvi = item["UVI"] as! String
            cell.backgroundColor = getCellBGColorByUVI(Float(uvi), cell: cell)
        }

        cell.textLabel?.text = county + "/" + siteName
        cell.detailTextLabel?.text = uvi
        
        return cell
    }
    
    func getCellBGColorByUVI(_ value: Float?, cell: UITableViewCell) -> UIColor {
        var color: UIColor = .white

        guard let value = value else {
            return color
        }
        
        switch value {
        case 0..<3:
            color = UIColor(red: 46/255, green: 148/255, blue: 23/255, alpha: 1)
            
        case 3..<6:
            color = UIColor(red: 246/255, green: 226/255, blue: 50/255, alpha: 1)
            
        case 6..<8:
            color = .orange
            
        case 8..<11:
            color = UIColor(red: 214/255, green: 10/255, blue: 38/255, alpha: 1)
            cell.imageView?.image = UIImage(named: "red")
            cell.textLabel?.textColor = UIColor.white
            cell.detailTextLabel?.textColor = cell.textLabel?.textColor
            
        case 11..<100:
            color = .purple
            
        default:
            break
        }
        
        return color
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

