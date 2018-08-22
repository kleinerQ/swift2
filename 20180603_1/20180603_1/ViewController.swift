//
//  ViewController.swift
//  20180603_1
//
//  Created by user on 2018/6/3.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        print("AA")
        let now_section = sender.view?.superview?.tag
        
        isSectionCollapseArray[now_section!] = !isSectionCollapseArray[now_section!]
        tableView.reloadSections(IndexSet(integer: now_section!), with: .automatic)
        
        
    }
    var list = [["台北\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆","台中","🍎","高雄\n台南"],["松山\n基隆","台中","🍎","高雄\n台南"]]
    var isCollapse:Bool = true
    var isSectionCollapseArray:[Bool] = [false,false]
    var isSectionCollapse:Bool = false
    var nowActionSection = 0
    var headerHeight:CGFloat = 0
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "行政區"
        case 1:
            return "行政區2"
            
        default:
            return "None"
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return isSectionCollapseArray[section] ? 0 : list[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = list[indexPath.section][indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = item
        return cell
    }
    
    

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let v = view as! UITableViewHeaderFooterView
//        print(v)
        v.textLabel?.textAlignment = .center
        v.tag = section
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.onTap(_:)))
    
        v.contentView.addGestureRecognizer(tap)
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

