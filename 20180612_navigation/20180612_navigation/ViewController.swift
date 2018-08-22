//
//  ViewController.swift
//  20180612_navigation
//
//  Created by Yen on 2018/6/12.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBAction func onClick(_ sender: Any) {
    
        let taipei101 = CLLocationCoordinate2D(latitude: 25.03, longitude: 121.56)
        let airport = CLLocationCoordinate2D(latitude: 25.06, longitude: 121.55)
        
        let pA = MKPlacemark(coordinate: taipei101, addressDictionary: nil)
        let pB = MKPlacemark(coordinate: airport, addressDictionary: nil)
        
        
        let miA = MKMapItem(placemark: pA)
        let miB = MKMapItem(placemark: pB)
        miA.name = "台101"
        miB.name = "松山機場"
        
        let routes = [miA,miB]
        
        let options = [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving]
        MKMapItem.openMaps(with: routes, launchOptions: options)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

