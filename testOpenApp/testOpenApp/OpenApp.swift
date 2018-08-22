//
//  OpenApp.swift
//  testOpenApp
//
//  Created by Yen on 2018/7/24.
//  Copyright © 2018年 Yen. All rights reserved.
//

import Foundation
import UIKit


extension UIApplication {
    class func tryURL(urls: [String]) {
        let application = UIApplication.shared
        for url in urls {
            if application.canOpenURL(URL(string: url)!) {
                application.openURL(URL(string: url)!)
                return
            }
        }
    }
}
