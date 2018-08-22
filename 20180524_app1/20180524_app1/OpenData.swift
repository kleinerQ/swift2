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
    
    func loadUVIData() {
        if let url = URL(string: "http://opendata2.epa.gov.tw/UV/UV.json") {
            do {
                let data = try Data(contentsOf: url)
                jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String: Any]]
            } catch {
                print(error)
            }
        }
    }
    
    func getJsonObject() -> [[String: Any]] {
        return jsonObject
    }
}
