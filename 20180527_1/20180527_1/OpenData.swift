//
//  OpenData.swift
//  20180527_1
//
//  Created by user on 2018/5/27.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit

class OpenData: NSObject {
    
    
    private var jsonObject:[[String:Any]] = []
    var jsonDataFlag = true
    
    
    func loadUVIData(){
//        self.clearJsonObject()
        if jsonObject.count == 0{
        
            loadJsonObject()
        
        }else{
            
            return
            
        }
        
        let q = DispatchQueue.global()
        q.async {
            if let url = URL(string: "http://opendata2.epa.gov.tw/UV/UV.json") {
                sleep(1)
                do{
                    let data = try Data(contentsOf: url)
                    self.jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments ) as! [[String : Any]]
                    self.saveJsonObject()
                }catch{
                    self.jsonDataFlag = false
                    print(error)
                }
            }
        }

        
    }
    
    func getJsonObject() -> [[String:Any]] {
        return jsonObject
    }
    
    func loadJsonObject(){
        
        let user = UserDefaults.standard
        jsonObject = user.object(forKey: "MY_UVI") as? [[String: Any]] ?? []
        
        
    }
  
    func saveJsonObject(){
        
        let user = UserDefaults.standard
        user.set(jsonObject, forKey: "MY_UVI")
    }
    
    func clearJsonObject(){
        
        let user = UserDefaults.standard
        user.removeObject(forKey: "MY_UVI")
        jsonObject.removeAll()
    }
    
    

}
