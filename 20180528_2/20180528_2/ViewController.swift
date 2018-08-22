//
//  ViewController.swift
//  20180528_2
//
//  Created by user on 2018/5/28.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var alertText: UITextField!
    
    var html: String = "0"
    
    func 完成後請通知我(_ text:String?,_ pwd:String?){
        if let text = text{
            //print(text)
            alertText.isHidden = false
            label.isHidden = false
            
            
            if let url = URL(string: "http://localhost/swift/logincheck.php"){
                do{
                    
                    var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30)
                    
                    request.httpBody = "uid=\(text)&pwd=\(pwd!)".data(using: .utf8)
                    request.httpMethod = "POST"
                    let config = URLSessionConfiguration.default
                    let session = URLSession(configuration: config)
                    let dataTask = session.dataTask(with: request){ (data, response,error) in if let data = data{
                        self.html = String(data: data , encoding: .utf8)!
                        print("html = \(self.html)")
                        print(pwd)
                        print(text)
                        DispatchQueue.main.async{
                            if self.html == "1"{
                                
                                
                                self.alertText.text = "登入成功"
                                
                                
                            }else{
                                
                                
                                self.alertText.text = "登入失敗，請重新登入"
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
    }

    @IBAction func onclick(_ sender: Any) {
        alertText.isHidden = true
        label.isHidden = true
        
        let alert = storyboard?.instantiateViewController(withIdentifier: "myalert")
        present(alert!, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        alertText.isHidden = true
        label.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

