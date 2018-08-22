//
//  Global.swift
//  20180606_1_layer
//
//  Created by Yen on 2018/6/6.
//  Copyright © 2018年 Yen. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{
    
    func 設定邊線顏色(_ color:CGColor){
        
        
        layer.borderWidth = 1
        layer.borderColor = color
        layer.frame = CGRect(
            x: frame.origin.x - 10 ,
            y: frame.origin.y - 10 ,
            width: frame.size.width + 20 ,
            height: frame.size.height + 20)
        
        
    }
    
}
