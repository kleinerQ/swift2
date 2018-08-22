//
//  OpenData.swift
//  20180524_1
//
//  Created by user on 2018/5/24.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit

class OpenData: NSObject {
    
    
    private var jsonObject: [[String:Any]] = []
    var vc: ViewController!
    
    
    
    func loadUVIData(){
//
        if jsonObject.count == 0{
//            NSLog("\(self.jsonObject)")
            loadJsonObject()
        }
//
        if jsonObject.count != 0{
            
            return
        }
        
        
        let q = DispatchQueue.global()
        q.async {
            sleep(3)
            if let url = URL(string: "http://opendata2.epa.gov.tw/UV/UV.json"){
                do{
                    let data = try Data(contentsOf: url)
                    self.jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String:Any]]
                    self.saveJsonObject()
//                    NSLog("\(self.jsonObject)")
//                    DispatchQueue.main.async {
//                        self.vc.資料準備好通知我()
//                    }
                    
                }catch{
                    print(error)
                    
                }
            }
        }
       
    }
    
    
    func setDelegate(_ vc: ViewController){
//        self.vc = vc
        
        let q = DispatchQueue.global()
        q.async {
            while (self.jsonObject.count == 0 ){
                sleep(1)

            }
            DispatchQueue.main.async {
                vc.資料準備好通知我()
            }
//
        }
//
//
    }

    
    func getJsonObject() ->[[String:Any]]{
        return jsonObject
    }
    
    private func saveJsonObject(){
        
        let user = UserDefaults.standard
        user.set(jsonObject,forKey: "MY_UVI")
        // user.synchronize()
    }

    private func loadJsonObject(){
//        print(jsonObject)
        let user = UserDefaults.standard
        jsonObject = user.object(forKey: "MY_UVI") as? [[String:Any]] ?? []
        
        
        
        
        
    }
    
    func clearJsonObject() {
        let user = UserDefaults.standard
        user.removeObject(forKey: "MY_UVI")
        jsonObject.removeAll()
    }
    
    

    

    

    
}
