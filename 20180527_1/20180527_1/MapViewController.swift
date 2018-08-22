//
//  MapViewController.swift
//  20180527_1
//
//  Created by Chihyen on 2018/5/27.
//  Copyright © 2018 iii. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    
    var lat_arr : [Substring] = []
    var log_arr : [Substring] = []
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let ann = MKPointAnnotation()
        ann.coordinate = CLLocationCoordinate2D(latitude: wgs84ToDouble(lat_arr), longitude: wgs84ToDouble(log_arr))
        mapView.addAnnotation(ann)
        mapView.centerCoordinate = ann.coordinate
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func wgs84ToDouble(_ data:[Substring]!)-> Double {
        
        return Double(data[0])! + Double(data[1])! / 60 + Double(data[2])! / 3600
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
