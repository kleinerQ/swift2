//
//  ViewController.swift
//  20180524_2
//
//  Created by user on 2018/5/24.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var jsonObject: [[String:Any]] = []
    

    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonObject.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "AAA";
        var item = jsonObject[indexPath.row]
        var county: String = "未知"
        var siteName: String = "未知"
        var uvi: String = "未知"
       // cell.backgroundColor  = UIColor.black

        if item["County"] is String{

            county = item["County"] as! String
        }

        if item["SiteName"] is String{

            siteName = item["SiteName"] as! String
        }
        if item["UVI"] is String{

            uvi = item["UVI"] as! String
        }

        cell.textLabel?.text = "\(county) / \(siteName) "
        cell.detailTextLabel?.text = "\(uvi)"

        return cell
        
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let url = URL(string: "http://opendata2.epa.gov.tw/UV/UV.json"){
            do{
                
                let data = try Data(contentsOf: url)
                jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String : Any]]
                
            }catch{
                
                print(error)
            }
            
            
        }

        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

