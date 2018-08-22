//
//  DMDatabase.swift
//  20180604_1
//
//  Created by Yen on 2018/6/4.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit
import SQLite3

class DMDatabase: NSObject {
    
    var db: OpaquePointer? = nil
    
    private static var _instance: DMDatabase? = nil
    private static var _db: OpaquePointer? = nil
    
    
    static var shared: DMDatabase {
        
        get {
            
            if _instance == nil{
                _instance = DMDatabase()
            
                if let dst = _instance!.copyToSandBoxDocument(){
                    
                    sqlite3_open(dst, &_db)
                }
            }
            return _instance!
            
        }
        
    }
    
    

    func copyToSandBoxDocument() ->String?{
        
        
        
        let fm = FileManager.default
        let src = Bundle.main.path(forResource: "mydb", ofType: ".sqlite")
        let dst = NSHomeDirectory() + "/Documents/mydb.sqlite"
        if !fm.fileExists(atPath: dst){
            try! fm.copyItem(atPath: src!, toPath: dst)
        }
        
        return dst
    }
    
    
//    func sqlite3Open(_ path:String!){
//        if sqlite3_open(path, &db) == SQLITE_OK{
//
//            print("OK")
//
//        }else{
//
//            print("XX")
//        }
//
//
//
//    }
    
    func 讀取資料()->[String]{
        
        return ["AABB"]
     
    }
    
    static func query() -> [NSData]?{
        
        if _db != nil{
            
            let tmp =  "李大媽".cString(using: .utf8)
            
//            let sql = "select * from 'UserData' where cname = ?"
            let sql = "select * from 'UserData'"
            var statement: OpaquePointer? = nil
            var imageArray:[NSData] = []
            if sqlite3_prepare(_db, sql, -1, &statement, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(_db))
                print("prepare error1: \(errmsg)")

            }

            
            var dataCounter = 0
            while sqlite3_step(statement) == SQLITE_ROW{
                print(dataCounter)
                let iid = sqlite3_column_text(statement, 0)
                let cname = sqlite3_column_text(statement, 1)
                
                if iid != nil {
                    
                    let iidS = String(cString: iid!)
                    print("帳號: \(iidS)")
                    dataCounter += 1
                }
                
                if cname != nil {
                    
                    let cnameS = String(cString: cname!)
                    print("姓名: \(cnameS)")
                }
                
                let length = sqlite3_column_bytes(statement, 2)
                let bytes = sqlite3_column_blob(statement, 2)

//                print(length)
//                print(bytes)
                



                let imageData = NSData(bytes: bytes, length: Int(length))

                imageArray.append(imageData)
                
                
                
                
            }
            
            sqlite3_finalize(statement)
            
            return imageArray
        }
        
        
        return nil
        
        
    }
    
    
    
    static func insertOne(iid:String, cname:String){
        
        if _db != nil {
            
            let iid = iid.cString(using: .utf8)
            let cname = cname.cString(using: .utf8)
            let sql = "Insert into UserData Values(?, ?, NULL)"
            var statement: OpaquePointer? = nil
            
            if sqlite3_prepare(_db, sql, -1, &statement, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(_db))
                print("prepare error3: \(errmsg)")
                
            }
            
            if sqlite3_bind_text(statement,1,iid,-1,nil) != SQLITE_OK{
                
                
                let errmsg = String(cString: sqlite3_errmsg(_db))
                print("prepare error4: \(errmsg)")
                
            }
            
            
            if sqlite3_bind_text(statement,2,cname,-1,nil) != SQLITE_OK{
                
                
                let errmsg = String(cString: sqlite3_errmsg(_db))
                print("prepare error5: \(errmsg)")
                
            }
            
            if sqlite3_step(statement) == SQLITE_DONE{
                print("插入新資料OK")
            }else{
                
                let errmsg = String(cString: sqlite3_errmsg(_db))
                print("prepare error6: \(errmsg)")
            }
            
            sqlite3_finalize(statement)
            
            
        }
        

        
        
        
        
    }
    
    
    static func saveImage(iid:String,imageName:String){
        if _db != nil{
            
            let imageData = NSData(data: UIImagePNGRepresentation(UIImage(named: imageName)!)!)
            let sql = "update UserData SET image = ? where iid = '\(iid)'"
            var statement: OpaquePointer? = nil
            
            if sqlite3_prepare(_db, sql, -1, &statement, nil) != SQLITE_OK {
                let errmsg = String(cString: sqlite3_errmsg(_db))
                print("prepare error3: \(errmsg)")
                
            }
            
            if sqlite3_bind_blob(statement,1,imageData.bytes,Int32(imageData.length),nil) != SQLITE_OK{
                
                
                let errmsg = String(cString: sqlite3_errmsg(_db))
                print("prepare error4: \(errmsg)")
                
            }
            
            
            if sqlite3_step(statement) == SQLITE_DONE{
                print("插入新圖片OK")
            }else{
                
                let errmsg = String(cString: sqlite3_errmsg(_db))
                print("prepare error7: \(errmsg)")
            }
            
            sqlite3_finalize(statement)
            
            
        }
        
    }
    
    
    
    
}
