//
//  OpenData.swift
//  20180524_app1
//
//  Created by KoKang Chu on 2018/5/24.
//  Copyright © 2018年 KoKang Chu. All rights reserved.
//

import UIKit

class OpenData: NSObject {
    
    private var jsonObject: [[String: Any]] = []
    private var stop = false
    
    
    
    func loadUVIData() {
        
        if jsonObject.count == 0 {
            loadJsonObject()
        }
        
        if jsonObject.count != 0 {
            return
        }
        
        let q = DispatchQueue.global()
        q.async {
            sleep(5)
            if let url = URL(string: "http://opendata2.epa.gov.tw/UV/UV.json") {
                do {
                    let data = try Data(contentsOf: url)
                    self.jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String: Any]]
                    self.saveJsonObject()
                } catch {
                    print(error)
                    self.stop = true
                }
            }
        }
    }
    
    func setDelegate(_ vc: ViewController) {
        let q = DispatchQueue.global()
        q.async {
            while self.jsonObject.count == 0, self.stop != true {
                sleep(1)
            }
            
            DispatchQueue.main.async {
                vc.資料準備好請通知我()
            }
        }
    }
    
    func getJsonObject() -> [[String: Any]] {
        return jsonObject
    }
    
    private func saveJsonObject() {
        let user = UserDefaults.standard
        user.set(jsonObject, forKey: "MY_UVI")
    }
    
    private func loadJsonObject() {
        let user = UserDefaults.standard
        jsonObject = user.object(forKey: "MY_UVI") as? [[String: Any]] ?? []
    }
    
    func clearJsonObject() {
        let user = UserDefaults.standard
        user.removeObject(forKey: "MY_UVI")
        jsonObject.removeAll()
    }
}
