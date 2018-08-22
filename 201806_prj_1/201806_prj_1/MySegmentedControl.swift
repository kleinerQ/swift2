//
//  MySegmentedControl.swift
//  201806_prj_1
//
//  Created by Yen on 2018/6/6.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class MySegmentedControl: UISegmentedControl {
    override func awakeFromNib() {
        layer.cornerRadius = 3
//
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 0.5
        self.tintColor = UIColor.orange
        
//        super.awakeFromNib()
//        for selectView in subviews{
//            selectView.layer.borderColor = UIColor.gray.cgColor
//            selectView.layer.borderWidth = CGFloat(0.3)
//            selectView.layer.cornerRadius = CGFloat(2)
//            selectView.layer.masksToBounds = true
//        }
         self.layer.masksToBounds = true
//        self.backgroundColor = UIColor.white
//
//
//        self.layer.cornerRadius = 1.0;
        
//        self.layer.borderWidth = 1.0
//        self.layer.masksToBounds = true;


        
        
        
        
        self.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.gray], for:.normal)
        

        self.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.white], for: UIControlState.selected)
//
//        setContentOffset(CGSize(width: 10, height: 10), forSegmentAt: 0)
        
        
        
//        let unselectedAttributes = [kCTForegroundColorAttributeName: UIColor.red,
//                                    kCTFontAttributeName:  UIFont.systemFont(ofSize: 103, weight: .regular)]
//        self.setTitleTextAttributes(unselectedAttributes, for: .normal)
    }
    
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
