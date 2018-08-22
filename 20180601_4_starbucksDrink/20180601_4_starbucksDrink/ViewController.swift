//
//  ViewController.swift
//  20180601_4_starbucksDrink
//
//  Created by user on 2018/6/1.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    let list = ["1.jpeg","2.jpeg","3.jpeg","4.jpeg","5.jpeg","6.jpeg","8.jpeg","4.jpeg","5.jpeg","6.jpeg","8.jpeg","4.jpeg","5.jpeg","6.jpeg","8.jpeg"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ((list.count - 1) % 2 == 1) ? (list.count / 2) + 1 + 1 : list.count / 2 + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        
        
        let leftLabel = cell.viewWithTag(1000) as! UILabel
        
        let rightLabel = cell.viewWithTag(2000) as! UILabel
        
        
        
        if indexPath.row == 0 {
            let leftImageView = ((cell.viewWithTag(100) as! UIImageView))
            leftImageView.image = UIImage(named: list[0])
            let rightImageView = ((cell.viewWithTag(200) as! UIImageView))
            leftLabel.text = list[0]
            rightImageView.superview?.isHidden = true
            
            
            
        }else{
            
            
            let leftImageView = ((cell.viewWithTag(100) as! UIImageView))
            leftImageView.image = UIImage(named: list[indexPath.row * 2 - 1])
            leftLabel.text = list[indexPath.row * 2 - 1]
            
            if indexPath.row * 2 < list.count{
                
                let rightImageView = ((cell.viewWithTag(200) as! UIImageView))
                rightImageView.superview?.isHidden = false
                rightImageView.image = UIImage(named: list[indexPath.row * 2])
                rightLabel.text = list[indexPath.row * 2]
            }else{
                let rightImageView = ((cell.viewWithTag(200) as! UIImageView))
                
                rightImageView.isHidden = true
                rightLabel.text = ""
                
                
            }
            

            
            
        }

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return UIScreen.main.bounds.size.width
        }
        return UITableViewAutomaticDimension
        
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

