//
//  ViewController.swift
//  20180613_1_test_DateToString
//
//  Created by Yen on 2018/6/13.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let testString = "2018/06/10"
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        //                    print(NSTimeZone.local)
        formatter.timeZone = TimeZone.current
        //dep time found
        let timeZoneOffset = 0
        let nowTimeDateType = formatter.date(from: testString)
        let modifiedQueryTimeDateType = nowTimeDateType?.addingTimeInterval(TimeInterval(3600 * 8))
        print(Calendar.current.component(.weekday, from: modifiedQueryTimeDateType!))
        print(modifiedQueryTimeDateType)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

