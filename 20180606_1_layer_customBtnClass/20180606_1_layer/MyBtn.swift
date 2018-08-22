//
//  MyBtn.swift
//  20180606_1_layer
//
//  Created by Yen on 2018/6/6.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class MyBtn: UIButton {

    override func awakeFromNib() {
        layer.borderWidth = 1
        
//        if restorationIdentifier?.lowercased() == "red"{
//
//            layer.borderColor = UIColor.red.cgColor
//        }
//
//        if restorationIdentifier?.lowercased() == "blue"{
//
//            layer.borderColor = UIColor.blue.cgColor
//        }
        if let color = value(forKeyPath: "layer.color") as? UIColor{
            
            layer.borderColor = color.cgColor
            
        }else{
            
//            layer.borderColor = UIColor.clear.cgColor
            
        }
        
        layer.frame = CGRect(
            x: frame.origin.x - 10 ,
            y: frame.origin.y - 10 ,
            width: frame.size.width + 20 ,
            height: frame.size.height + 20)
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
