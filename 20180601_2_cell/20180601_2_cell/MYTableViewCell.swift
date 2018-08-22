//
//  MYTableViewCell.swift
//  20180601_2_cell
//
//  Created by user on 2018/6/1.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit

class MYTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var 單價: UITextField!
    @IBOutlet weak var 產品名稱: UILabel!

    private static var  list:[String] = []
    
    
    @IBAction func onDone(_ sender: UIButton) {
        單價.resignFirstResponder()
        if 單價.text == ""{
            print("價格未輸入")
            return
        }
        
        let price = Int(單價.text!)!
        
        if 產品名稱.text == "鉛筆", price < 5 {
            showAlert("價格設定錯誤")
            return
        
        }
        
        if 產品名稱.text == "橡皮擦", price < 20 {
            showAlert("價格設定錯誤")
            return
            
        }
        print(單價.text!)
        
    }
    
    static func loadData() -> [String]{
        MYTableViewCell.list.append("鉛筆")
        MYTableViewCell.list.append("橡皮擦")
        MYTableViewCell.list.append("膠水")
        MYTableViewCell.list.append("迴紋針")
        MYTableViewCell.list.append("迴紋針2")
        return MYTableViewCell.list
    }

    func showAlert(_ msg:String){
        let alert = UIAlertController(title: "警告", message: "\(產品名稱.text!)\(msg)", preferredStyle: .alert)
    
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        let app = UIApplication.shared.delegate as! AppDelegate
        app.window?.rootViewController?.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func counter(_ sender: UIStepper) {
//        產品名稱.text = String(sender.value)
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
