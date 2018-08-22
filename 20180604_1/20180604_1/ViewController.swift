//
//  ViewController.swift
//  20180604_1
//
//  Created by Yen on 2018/6/4.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBAction func onClickInsert(_ sender: UIButton) {
        
        if inputField.text != ""{
            DMDatabase.insertOne(iid: inputField.text!, cname: cnameInput.text!)
            DMDatabase.saveImage(iid: inputField.text!, imageName: "1")
            
        }
        
        
    }
    @IBOutlet weak var cnameInput: UITextField!
    
    var imageArray:[NSData?] = []
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let imageView = cell.viewWithTag(1000) as! UIImageView
//        print(indexPath.row)
        
        print(imageArray)
        if indexPath.row < imageArray.count{
            if let image = imageArray[indexPath.row]{
                //
                imageView.image = UIImage(data:image as! Data)
            }
            
        }

//        print(indexPath.row)
        
        
        
        return cell
    }
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var inputField: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    
    @IBAction func onClick(_ sender: UIButton) {

        imageArray = DMDatabase.query()!
        
//        let user = UserDefaults.standard
        
        
//        if let text = inputField.text{
        
            
            
//            print(NSHomeDirectory())
//            var src, dst: String
//            let fm = FileManager.default
            // create 目錄
//            let path = NSHomeDirectory() + "/Documents"
//            src = path + "/data"
//            do {
//                try fm.createDirectory(atPath: src, withIntermediateDirectories: true, attributes: nil)
//            }catch{
//
//                print("create Fail")
//            }
//            user.set(text, forKey: MYKEYS.Key1)
//            user.synchronize()
            

        
//
//            let path = NSHomeDirectory()
//
//            src = path + "/tmp/data3"
//            dst = path + "/Documents/data3_2"
////            print(dst)
//            do{
//                try fm.moveItem(atPath: dst, toPath: src)
//
//            }catch{
//
//                print("move fail")
//
//            }
            
            
            
            
//        }
        
//        let showString = user.object(forKey: MYKEYS.Key1)!
//        label.text = showString as! String
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let path = NSHomeDirectory() + "/Documents/Property List.plist"
//        if let plist = NSMutableDictionary(contentsOfFile: path){
//            if let color = plist["color"]{
//                print("The color is \(color)")
//            }
//            plist["color"] = "Green"
//
//            if plist.write(toFile: path, atomically: true){
//                print("修改顏色成功")
//            }
//
//        }
//        imageArray = DMDatabase.query()
//        DMDatabase.insertOne(iid: " a04", cname: "大王")
//        DMDatabase.query()
        
        
//        if DMDatabase.query() != nil{
//            imageView.image = UIImage(data:DMDatabase.query() as! Data)
//        }
//        DMDatabase.saveImage()
        
        //let x = DMDatabase.shared.讀取資料()
        
        
        
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

