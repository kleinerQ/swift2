//
//  MenuTableViewController.swift
//  20180530_1
//
//  Created by user on 2018/5/30.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController,UIGestureRecognizerDelegate {

    var originalX:CGFloat!
    @IBAction func panForMotion(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: (parent as! ViewController).view)

//                print(location.x)
        
    
        
        
        switch sender.state {
        case .began:
            originalX = location.x
//            print(originalX)
            
            
        case .ended:
            
            
            if (parent as! ViewController).leadingEdgeConstraint.constant < 0 {

                (parent as! ViewController).leadingEdgeConstraint.constant = -240
                UIView.animate(withDuration: 0.5){
                    
                    (self.parent as! ViewController).view.layoutIfNeeded()
                    
                }

            }
            
            if (parent as! ViewController).leadingEdgeGrayConstraint.constant < 0 {
                
                (parent as! ViewController).leadingEdgeGrayConstraint.constant = -300
                UIView.animate(withDuration: 0.5){
                    
                    (self.parent as! ViewController).view.layoutIfNeeded()
                    
                }
                
            }
            
            if (parent as! ViewController).leadingEdgeGrayConstraint.constant > 0 {
                
                (parent as! ViewController).leadingEdgeGrayConstraint.constant = 0
                UIView.animate(withDuration: 0.5){
                    
                    (self.parent as! ViewController).view.layoutIfNeeded()
                    
                }
                
            }
            
            break
            
        case .changed:
            
            let nowPos = (parent as! ViewController).leadingEdgeConstraint.constant
            
            
            
            if (nowPos + location.x - originalX) > 0{
                (parent as! ViewController).leadingEdgeConstraint.constant = 0
//                print(nowPos)
//                (parent as! ViewController).leadingEdgeConstraint.constant = -240 + location.x - originalX

            }else{
                (parent as! ViewController).leadingEdgeConstraint.constant = location.x - originalX
                UIView.animate(withDuration: 0.5){
                    
                    (self.parent as! ViewController).view.layoutIfNeeded()

                }
                //print(location.x)
               
            }
            
            (parent as! ViewController).leadingEdgeGrayConstraint.constant = location.x - originalX
            UIView.animate(withDuration: 0.5){
                
                (self.parent as! ViewController).view.layoutIfNeeded()
                
            }
//
//
//            }
            
            //print((parent as! ViewController).leadingEdgeConstraint.constant)
            
            
//            print((parent as! ViewController).leadingEdgeConstraint.constant)
            //            if leadingEdgeConstraint.constant > 0{
            //                leadingEdgeConstraint.constant = 0
            ////                UIView.animate(withDuration: 0.5){
            ////                    self.view.layoutIfNeeded()
            ////                }
            //            }else{
            //
            //                leadingEdgeConstraint.constant = -252 + location.x - originalX
        //            }
            break
        default:
            break
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
