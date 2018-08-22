//
//  MyLabel.swift
//  20180606_1_layer
//
//  Created by Yen on 2018/6/6.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class MyLabel: UILabel {


    let adLayer = CATextLayer()
    
    override func awakeFromNib() {
        
        adLayer.frame = bounds
        adLayer.foregroundColor = textColor.cgColor
        adLayer.backgroundColor = backgroundColor?.cgColor
        
        adLayer.font = font
        adLayer.fontSize = font.pointSize
        
        adLayer.alignmentMode = kCAAlignmentJustified
        adLayer.contentsScale = UIScreen.main.scale // without it the font would be blurry
        
        layer.addSublayer(adLayer)
        adLayer.string = text! + "\n "
        text = " "
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
