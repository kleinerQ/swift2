//
//  MovingBarTableViewController.swift
//  20180530_3_starbucksAgain
//
//  Created by user on 2018/5/30.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit

class MovingBarTableViewController: UITableViewController {
    
    var originalX:CGFloat! = 0
    
    
    @IBAction func movingBarPanGesture(_ sender: UIPanGestureRecognizer) {

        let vc = parent as! ViewController
        let location = sender.location(in: vc.view )
        
        switch sender.state {
        case .began:
            originalX = location.x
            
        case .ended:
            if vc.leadingConstrainMovingBar.constant > 0{
                vc.leadingConstrainMovingBar.constant = 0
            }else if vc.leadingConstrainMovingBar.constant < 0 {
                vc.leadingConstrainMovingBar.constant = (-1 * vc.movingBarWidth.constant)
            }
            
            
            if vc.leadingConstrainContainer.constant > 0{
                vc.leadingConstrainContainer.constant = vc.containerWidth.constant - vc.movingBarWidth.constant
            }else if vc.leadingConstrainContainer.constant < 0 {
                vc.leadingConstrainContainer.constant = (-1 * vc.containerWidth.constant)
            }
            
            if vc.leadingConstrainTube.constant < 0 {
                vc.leadingConstrainTube.constant = (-1 * vc.tubeWidth.constant)
            }
            
            UIView.animate(withDuration: 0.5){
                vc.view.layoutIfNeeded()
            }
            
            
        case .changed:
            let movingQuantity = location.x - originalX
//            print(movingQuantity)
            if movingQuantity > 0 {
                vc.leadingConstrainMovingBar.constant = 0
            }else{
                vc.leadingConstrainMovingBar.constant = 0 + movingQuantity
            }
            //
            if movingQuantity < vc.movingBarWidth.constant {
                vc.leadingConstrainContainer.constant = 0 + movingQuantity
            }
            if movingQuantity < 0{
            
                vc.leadingConstrainTube.constant = 0 + movingQuantity
            }
            UIView.animate(withDuration: 0.5){
                vc.view.layoutIfNeeded()
            }
            
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
