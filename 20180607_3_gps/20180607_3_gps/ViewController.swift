//
//  ViewController.swift
//  20180607_3_gps
//
//  Created by Yen on 2018/6/7.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit
import CoreLocation
class ViewController: UIViewController, CLLocationManagerDelegate{

    let lm = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        lm.requestAlwaysAuthorization()
        lm.delegate = self
        lm.startUpdatingLocation()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("GGG")
        if let location = locations.first{
            print("緯度： \(location.coordinate.latitude)")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

