//
//  ResultTVC.swift
//  20180524_1
//
//  Created by user on 2018/5/25.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit

class ResultTVC: UITableViewController, UISearchResultsUpdating {
    
//    let app2 = UIApplication.shared.delegate as! ViewController
    let app2 = UIApplication.shared.delegate as! AppDelegate
    var filterList: [[String:Any]] = []
    func updateSearchResults(for searchController: UISearchController) {
        
        if let searchText = searchController.searchBar.text{
            filterList.removeAll()
            for data in app2.uviData.getJsonObject(){
                var county: String = "未知"
                if data["County"] is String{
                    county = data["County"] as! String

                    if county.contains(searchText){
//                        NSLog(county)
                        filterList.append(data)
                        
                    }
                }

            }
        tableView.reloadData()
        }
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return filterList.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let item = filterList[indexPath.row]
        //NSLog(indexPath)
        var county: String = "未知"
        var siteName: String = "未知"
        var uvi: String = "未知"
//        cell.imageView?.image=nil
//        cell.textLabel?.textColor = UIColor.black
//        cell.detailTextLabel?.textColor = cell.textLabel?.textColor
        
        if item["County"] is String{
            county = item["County"] as! String
            
        }
        
        if item["SiteName"] is String{
            siteName = item["SiteName"] as! String
        }
        
        if item["UVI"] is String{
            uvi = item["UVI"] as! String
        // Configure the cell...

        }
        cell.textLabel?.text = county + "/" + siteName
        cell.detailTextLabel?.text = uvi
        return cell
    }
 

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
