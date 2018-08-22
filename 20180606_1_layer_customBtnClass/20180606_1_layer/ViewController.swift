//
//  ViewController.swift
//  20180606_1_layer
//
//  Created by Yen on 2018/6/6.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        UIApplication.shared.isNetworkActivityIndicatorVisible = true

        btn2.設定邊線顏色(UIColor.red.cgColor)
        //label3.textAlignment = .justified
        
        //label3.text = label3.text! + "\n dsf"
        label4.text = "sadfjksajfksjakfj"
        
        
        
        let maskLayer = CALayer()
        
        maskLayer.frame = imageView.bounds
        maskLayer.contents = UIImage(named: "heart")?.cgImage // must transform
        maskLayer.contentsScale = UIScreen.main.scale
        imageView.layer.mask = maskLayer
    }
    @IBOutlet weak var btn2: UIButton!
    
    @IBOutlet weak var label3: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var label4: UILabel!
    
}

