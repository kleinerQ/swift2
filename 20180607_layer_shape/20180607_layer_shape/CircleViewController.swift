//
//  CircleViewController.swift
//  20180607_layer_shape
//
//  Created by Yen on 2018/6/7.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class CircleViewController: UIViewController {
    
    var currentValue:CGFloat = 30
    
    
    func drawCircle(withColor color: CGColor) -> CAShapeLayer{
        
        var radius:CGFloat = 0
        let paintLineWidth:CGFloat = 20
        //horizental
        if view.frame.size.width > view.frame.size.height {
            
            radius = view.frame.size.height / 2 - paintLineWidth / 2
            
        }else{
            
            radius = view.frame.size.width / 2 - paintLineWidth / 2
            
        }
        
        
        let shapeLayer = CAShapeLayer()
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: view.center.x, y: view.center.y),
            radius: radius,
            startAngle: 120 * CGFloat.pi / 180 ,        //radius
            endAngle: 420 * CGFloat.pi / 180,
            clockwise: true)
        shapeLayer.strokeColor = color
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = paintLineWidth
        shapeLayer.path = circlePath.cgPath
 
 
    
        return shapeLayer
        
        //119 103 69
        
    }

    func strokeEndAnimation(to: CGFloat)-> CABasicAnimation {
        
        let ani = CABasicAnimation(keyPath: "strokeEnd")
        ani.duration = 3
        ani.fromValue = 0
        ani.toValue = to / 35.0
        ani.isRemovedOnCompletion = false
        
        ani.fillMode = kCAFillModeForwards
        ani.repeatCount = 0
        
        return ani
    }
    
    func strokeEndAnimationSlow(to: CGFloat)-> CAKeyframeAnimation {
        
        let ani = CAKeyframeAnimation(keyPath: "strokeEnd")
        ani.duration = 3

        ani.values = [0, to / 35.0]
        
        ani.timingFunctions = [
            CAMediaTimingFunction(controlPoints: 0.71, 0.67, 0.4, 0.94)
        ]
//        .17,.67,.4,.92
        
        
        ani.isRemovedOnCompletion = false
        
        ani.fillMode = kCAFillModeForwards
        ani.repeatCount = 0
        
        return ani
    }
    
    
    
    func strokeEndAnimationChangeColor(to: CGFloat)-> CAKeyframeAnimation {
        
        let ani = CAKeyframeAnimation(keyPath: "strokeColor")
        ani.duration = 3
        
        ani.values = [UIColor.red.cgColor,UIColor.green.cgColor]
        
        
        
        ani.isRemovedOnCompletion = false
        
        ani.fillMode = kCAFillModeForwards
        ani.repeatCount = 0
        
        return ani
    }
    
    
    @IBOutlet weak var label: UILabel!
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let bgColor = UIColor(red: 119/255.0 , green: 103/255.0, blue: 69/255.0, alpha: 1)
        
        let bgLayer = drawCircle(withColor: bgColor.cgColor)
        //bgLayer.add(strokeEndAnimation(to: 10), forKey: nil)
        view.layer.addSublayer(bgLayer)
        
        
        let currentColor = UIColor.white
        let currentLayer = drawCircle(withColor: currentColor.cgColor)
        currentLayer.add(strokeEndAnimationSlow(to: currentValue), forKey: nil)
        currentLayer.add(strokeEndAnimationChangeColor(to: currentValue), forKey: nil)
        view.layer.addSublayer(currentLayer)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = "\(Int(currentValue)) / 35 "
        
        // Do any additional setup after loading the view.
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
