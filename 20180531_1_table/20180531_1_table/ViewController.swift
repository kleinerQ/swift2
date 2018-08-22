//
//  ViewController.swift
//  20180531_1_table
//
//  Created by user on 2018/5/31.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    var list = [["台北\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆\n松山\n基隆","台中","🍎","高雄\n台南"],["松山\n基隆","台中","🍎","高雄\n台南"]]
    var isCollapse:Bool = true
    var isSectionCollapseArray:[Bool] = [false,false]
    var isSectionCollapse:Bool = false
    var nowActionSection = 0
    var headerHeight:CGFloat = 0
    //var headerLocationArray:[CGFloat?] = [nil,nil,nil,nil]
    var hearderVcArray:[UITableViewHeaderFooterView?] = [nil,nil,nil,nil]
    
    @IBAction func onTabGesture(_ sender: UITapGestureRecognizer) {
        
//        print("AA")
        let now_section = sender.view?.superview?.tag
        
        isSectionCollapseArray[now_section!] = !isSectionCollapseArray[now_section!]
        tableView.reloadSections(IndexSet(integer: now_section!), with: .automatic)
        
        
        
    }
    
    @IBAction func onTapGestureTest(_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: tableView)
        


        for i  in 0 ..< list.count {

            print("User: \(location.y)")

            
            if let vc = hearderVcArray[i] {
                print("section\(i)")
                print(vc.frame)
                if findInRangeOrNot(Double(vc.frame.origin.y), Double(location.y), headerHeight: vc.frame.size.height){

                isSectionCollapseArray[i] = !isSectionCollapseArray[i]
                tableView.reloadSections(IndexSet(integer: i), with: .automatic)
                }
                
            }
//           tableView.reloadSections(IndexSet(integer: i), with: .automatic)

        }
//        for i in 0 ..< list.count{
//             tableView.reloadSections(IndexSet(integer: i), with: .automatic)
//        }
        
        
    }
    
    
    func findInRangeOrNot(_ originalY:Double,_ checkedY:Double, headerHeight:CGFloat) -> Bool{
        let headerHeight = headerHeight
//        print(headerHeight)
        if abs(checkedY-(originalY + Double(headerHeight/2))) < Double(headerHeight/2){
//            print(checkedY,originalY)
//            print("Yes")
            return true
        }
//        print(checkedY,originalY)
//        print("XX")
        return false
    }
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    
    @IBOutlet var tapGesture2: UITapGestureRecognizer!
    
    
    @IBAction func onTabGesture2(_ sender: UITapGestureRecognizer) {
//        print("BB")
        let now_section = sender.view?.superview?.tag
        
        isSectionCollapseArray[now_section!] = !isSectionCollapseArray[now_section!]
        tableView.reloadSections(IndexSet(integer: now_section!), with: .automatic)
    }
    
    
    //MARK: 表格第一階段對話
    func numberOfSections(in tableView: UITableView) -> Int {
        return list.count
    }
    
    //MARK: 表格第二階段對話
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        if isSectionCollapse == true{
//
//            return 0
//        }
        return (isSectionCollapseArray[section]) ? 0 : list[section].count
    }
    
    
    //MARK: 表格第三階段對話
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = list[indexPath.section][indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = item
        return cell
        
    }
    
    //MARK: 被選中cell的indexPath
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.addGestureRecognizer(tapGesture)
        if list[indexPath.section][indexPath.row] == "🍎"{
            isCollapse = !isCollapse

            tableView.beginUpdates()
            tableView.endUpdates()
//            tableView.reloadData()
        }
    }
    

    //MARK: - 設定儲存格高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if list[indexPath.section][indexPath.row] == "台中", isCollapse{
            return 0
        }
        
        return UITableViewAutomaticDimension
    }
    
    
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
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let v = view as! UITableViewHeaderFooterView
        print(v)
        v.textLabel?.textAlignment = .center
        v.tag = section
//        headerHeight = 28
        //print("headerHeight\(headerHeight)")
        print("section: \(section)")
        
        hearderVcArray[section] = v
//        print(section)
//        print(v)
//        print(headerLocationArray)
//        print(v.frame.origin.y)
        //print(v.frame.size.he)
        
//        v.contentView.addGestureRecognizer(tapGesture)
        
//        switch section {
//        case 0:
//            print("CC")
//            v.contentView.addGestureRecognizer(tapGesture)
////            print(tapGesture)
//
//        case 1:
//            print("DD")
//            v.contentView.addGestureRecognizer(tapGesture2)
////            print(tapGesture)
//        default:
//            break
//        }
        
        
//        if section == 1{
//
//            v.contentView.addGestureRecognizer(tapGesture)
//        }
//        print(tapGesture)
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

