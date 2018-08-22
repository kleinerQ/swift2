//
//  ViewController.swift
//  20180608_2_chatting
//
//  Created by Yen on 2018/6/8.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func onClickTest(_ sender: UITapGestureRecognizer) {
        print("AAA")
    }
    
    
    var iStream: InputStream? = nil
    var oStream: OutputStream? = nil
    
    @IBAction func onclickSend(_ sender: UIButton) {
        if let text = myText.text{
            
            send(text)
        }
        
    }
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myText: UITextField!
    
    func receiveData(available: (_ string:String?) -> Void){
        var buf = Array(repeating: UInt8(0), count:1024)
        while true {
            if let n = iStream?.read(&buf, maxLength: 1024){
                let data = Data(bytes: buf, count: n)
                print(data.count)
                let string = String(data: data, encoding: .utf8)
                available(string)
            }
            
        }
    }
    
    func send(_ string:String){
        var buf = Array(repeating: UInt8(0), count: 1024)
        let data = string.data(using: .utf8)!
        data.copyBytes(to: &buf, count: data.count)
        oStream?.write(buf, maxLength: data.count)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let _ = Stream.getStreamsToHost(withName: "192.168.3.6", port: 5001, inputStream: &iStream, outputStream: &oStream)
        iStream?.open()
        oStream?.open()
        
        
        DispatchQueue.global().async {
            self.receiveData(available: { (string) in
                DispatchQueue.main.async {
                    self.myLabel.text?.append("\n\((string) as! String)")
                }
                
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

