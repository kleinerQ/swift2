//
//  ViewController.swift
//  20180614_1_onTapGestureTest
//
//  Created by Yen on 2018/6/14.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        
        print("AASDF")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.onTap(_:)))
        cell.addGestureRecognizer(tap)
        
//        let tap = UITapGestureRecognizer(target: self, action: #selector(self.onTap(_:)))
        return cell
    }
    

    let list = ["AA","BB","CC"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

