//
//  MapViewController.swift
//  20180524_1
//
//  Created by user on 2018/5/25.
//  Copyright © 2018年 iii. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    
    var lat_arr: [Substring]? = nil
    var lot_arr: [Substring]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let ann = MKPointAnnotation()
        ann.coordinate = CLLocationCoordinate2D(latitude: wgs84ToDouble(lat_arr!), longitude: wgs84ToDouble(lot_arr!))
        mapView.addAnnotation(ann)
        mapView.centerCoordinate = ann.coordinate
    }

    private func wgs84ToDouble(_ arr:[Substring])-> Double{
        let degree = Double(arr[0])!
        let min = Double(arr[1])!
        let sec = Double(arr[2])!
        return degree + min / 60 + sec / 3600
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
