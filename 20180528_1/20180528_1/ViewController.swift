//
//  ViewController.swift
//  20180528_1
//
//  Created by user on 2018/5/28.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var uid: UITextField!
    @IBOutlet weak var pwd: UITextField!
    var html: String = "0"
    
    @IBAction func onclick(_ sender: Any) {
//        let alert = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
//
//        // one action correspond to one action create as needed
//        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
//            print("this is OK")
//            self.performSegue(withIdentifier: "vc_to_welcome", sender: self)
//        }
//
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        alert.addAction(okAction)
//        alert.addAction(cancelAction)
//        present(alert, animated: true, completion: nil)
        
        
        //get
//        if let url = URL(string: "http://localhost/swift/logincheck.php?uid=\(uid.text!)&pwd=\(pwd.text!)"){
//            do{
//                print(url)
//                html = try String(contentsOf: url)
//                print(html)
//                if html == "1"{
//                    performSegue(withIdentifier: "vc_to_welcome", sender: self)
//                }
//
//
//
//            }catch{
//
//               print(error)
//            }
//
//        }
        
        //post
     
                if let url = URL(string: "http://localhost/swift/logincheck.php"){
                    do{
                        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30)
        
                        request.httpBody = "uid=\(uid.text!)&pwd=\(pwd.text!)".data(using: .utf8)
                        request.httpMethod = "POST"
                        let config = URLSessionConfiguration.default
                        let session = URLSession(configuration: config)
                        let dataTask = session.dataTask(with: request){ (data, response,error) in if let data = data{
                                self.html = String(data: data , encoding: .utf8)!
                            
                                DispatchQueue.main.async{
                                    if self.html == "1"{


                                            self.performSegue(withIdentifier: "vc_to_welcome", sender: self)


                                    }else{

                                        let alert = UIAlertController(title: "登入失敗", message: "請重新登入", preferredStyle: .alert)
                                        
                                        let okAction = UIAlertAction(title: "重試", style: .default) { (action) in
                                                
                                                print("login Fail")
                                            }
                                        
                                        
                                        alert.addAction(okAction)
                                        
                                        self.present(alert, animated: true, completion: nil)
                                    }
                                }

                            
                            }
                            
                            
                        }
                        dataTask.resume()
        
                    }catch{
        
                       print(error)
                    }
        
                }
        
        
        
        
        
    }
    
    
//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//        print("AAA")
////        if identifier == "vc_to_welcome"{
////
////            if html == "1"{
////                return true
////            }
////            return false
////
////        }
//                return true
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

