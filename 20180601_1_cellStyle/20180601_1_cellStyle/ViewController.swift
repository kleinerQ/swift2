//
//  ViewController.swift
//  20180601_1_cellStyle
//
//  Created by user on 2018/6/1.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func valueChange(_ sender: UISwitch) {
        
//        tableView.reloadSections(IndexSet(integer: ), with: .automatic)
        let label = sender.superview?.viewWithTag(100) as! UILabel
//
        label.backgroundColor = (sender.isOn) ? .green : .yellow
        
    }
    let list = ["台北\n板橋\n桃園","台中\n彰化\n員林","高雄"]

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.rowHeight = UITableViewAutomaticDimension
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = list[indexPath.row]
        let label = cell.viewWithTag(100) as! UILabel
        label.numberOfLines = 0
        label.text = item

//        let myswitch = cell.viewWithTag(200) as! UISwitch
//        if myswitch.isOn == false {
//            label.backgroundColor = UIColor.white
//        }
//
        return cell
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

