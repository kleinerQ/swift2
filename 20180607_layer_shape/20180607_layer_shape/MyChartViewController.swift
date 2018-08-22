//
//  MyChartViewController.swift
//  20180607_layer_shape
//
//  Created by Yen on 2018/6/7.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit

class MyChartViewController: UIViewController {
    
    func drawRect(withColor color: CGColor) -> CAShapeLayer{
        
        
        let paintLineWidth:CGFloat = 3
        
        let diagramWidth = view.frame.size.width
        let diagramHeight = view.frame.size.height
        
        
        let shapeLayer = CAShapeLayer()
        let rectPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: diagramWidth, height: diagramHeight))
        shapeLayer.strokeColor = color
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.borderWidth = paintLineWidth
        shapeLayer.lineWidth = paintLineWidth
        shapeLayer.path = rectPath.cgPath
        

        
        
        
        return shapeLayer
        
        //119 103 69
        
    }
    
 

    
    func drawTableLine() -> CAShapeLayer{
        
        
        let shapeLayer = CAShapeLayer()
        let linePath = UIBezierPath()
        let diagramWidth = view.frame.size.width
        let diagramHeight = view.frame.size.height
        let diagramShare = 10
        for index in 0 ..< diagramShare {
            //print(diagramHeight)
            linePath.move(to: CGPoint(x: 0, y: diagramHeight / CGFloat(diagramShare) * CGFloat(index)))
            linePath.addLine(to: CGPoint(x: diagramWidth, y: diagramHeight/CGFloat(diagramShare) * CGFloat(index)))
        }

        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 0.1
        shapeLayer.path = linePath.cgPath
        
        
        
        
        return shapeLayer
        
    }
    // input(0,100)
    func drawLine(listOfDrawingPoint:[CGPoint], color: CGColor) -> CAShapeLayer{
        
        let shapeLayer = CAShapeLayer()
        let linePath = UIBezierPath()
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineJoin = kCALineJoinRound
        linePath.move(to:listOfDrawingPoint[0])

        
        for index in 0 ..< listOfDrawingPoint.count {

            linePath.addLine(to: listOfDrawingPoint[index])
        }
        
        shapeLayer.strokeColor = color 
        shapeLayer.lineWidth = 10
        shapeLayer.path = linePath.cgPath

        return shapeLayer
        
        
    }
    
    
    func drawHistogram(listOfDrawingPoint:[CGPoint], color: CGColor,histogramWidth: CGFloat) -> CAShapeLayer{
        
        
        let shapeLayer = CAShapeLayer()
        let linePath = UIBezierPath()
        let diagramHeight = view.frame.size.height
        
        
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        //        shapeLayer.lineDashPattern = [3,3]
//        shapeLayer.lineJoin = kCALineJoinRound
        

        
        
        for index in 0 ..< listOfDrawingPoint.count {
            
            linePath.move(to: CGPoint(x: listOfDrawingPoint[index].x, y: diagramHeight))
            
            linePath.addLine(to: listOfDrawingPoint[index])
            
        }
        
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = histogramWidth
        shapeLayer.path = linePath.cgPath
        
        
        
        
        return shapeLayer
        
    }
    
    
    func transformDatalistIntoDiagramDataLocation(dataList:[Float]) ->[CGPoint]{
        
        var diagramDataLocation : [CGPoint] = []
        var diagramWidth = view.frame.size.width
        var diagramHeight = view.frame.size.height
        let diagramWidthShare = dataList.count + 1
        var drawingPoint = CGPoint()
        
//        if view.frame.size.width > view.frame.size.height{
//            print("sdfsdf")
//            (diagramWidth , diagramHeight) = (view.frame.size.height , view.frame.size.width)
//        }
        
        for index in 0 ..< dataList.count{
        
            drawingPoint.x = CGFloat(diagramWidth) / CGFloat(diagramWidthShare) * CGFloat(index+1)
            drawingPoint.y = CGFloat(dataList[index]) * CGFloat(diagramHeight) / CGFloat(-100) + CGFloat(diagramHeight)
            diagramDataLocation.append(drawingPoint)
            
        }
        
        return diagramDataLocation
    }
    
    func drawDataDot(listOfDrawingPoint:[CGPoint], color: CGColor, pointRadius: CGFloat) -> CAShapeLayer{
        //must be call after drawLine(), because the listOfDrawingPoint would be created
        
        
        let radius = pointRadius
        let paintLineWidth:CGFloat = 0
        
        //horizental
//        if view.frame.size.width > view.frame.size.height {
//
//            radius = view.frame.size.height / 2 - paintLineWidth / 2
//
//        }else{
//
//            radius = view.frame.size.width / 2 - paintLineWidth / 2
//
//        }
        
        
        let shapeLayer = CAShapeLayer()
        let circlePath = UIBezierPath(
            arcCenter: CGPoint(x: listOfDrawingPoint[0].x, y: listOfDrawingPoint[0].y),
            radius: radius,
            startAngle: 0 * CGFloat.pi / 180 ,        //radius
            endAngle: 360 * CGFloat.pi / 180,
            clockwise: true)
        
        for point in listOfDrawingPoint{
        
            
            print(point)

            circlePath.move(to: point)
            circlePath.addArc(withCenter: point, radius: radius, startAngle: 0 * CGFloat.pi / 180, endAngle: 360 * CGFloat.pi / 180, clockwise: true)
        }
        
//        shapeLayer.strokeColor = color
        shapeLayer.fillColor = color
        shapeLayer.lineWidth = paintLineWidth
        
        
        
        
        shapeLayer.path = circlePath.cgPath
        
        
        
        return shapeLayer
        
        
    }
    
    
    func historgramAnimation()-> CAKeyframeAnimation {
        
        let ani = CAKeyframeAnimation(keyPath: "strokeEnd")
        ani.duration = 3
        
        ani.values = [0, 1]
        
        ani.timingFunctions = [
            CAMediaTimingFunction(controlPoints: 0.71, 0.67, 0.4, 0.94)
        ]
        
        //        .17,.67,.4,.92
        
        
        ani.isRemovedOnCompletion = false
        
        ani.fillMode = kCAFillModeForwards
        ani.repeatCount = 0
        
        return ani
    }
    

    override func viewDidAppear(_ animated: Bool) {
        
        let listOfDrawingPoint = transformDatalistIntoDiagramDataLocation(dataList: [20,40,30,50,79,20,10, 80,60, 10,34,25])
        
        view.layer.addSublayer(drawRect(withColor: UIColor.red.cgColor))
        view.layer.addSublayer(drawTableLine())
        
        view.layer.addSublayer(drawLine(listOfDrawingPoint: listOfDrawingPoint, color: UIColor.green.cgColor))
//        view.layer.addSublayer(drawDataDot(listOfDrawingPoint: listOfDrawingPoint, color: UIColor.red.cgColor, pointRadius: 5))
        let histogramLayer = drawHistogram(listOfDrawingPoint: listOfDrawingPoint, color: UIColor.blue.cgColor, histogramWidth: 10)
        
        histogramLayer.add(historgramAnimation(), forKey: nil)
        view.layer.addSublayer(histogramLayer)
        
        
        for i in 0 ..< listOfDrawingPoint.count {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
            
            // and set the text color too - remember good contrast
            label.textColor = .black
            
            // may not be necessary (e.g., if the width & height match the superview)
            // if you do need to center, CGPointMake has been deprecated, so use this
            label.center = CGPoint(x: listOfDrawingPoint[i].x, y: view.frame.size.height + 20)
            
            // this changed in Swift 3 (much better, no?)
            label.textAlignment = .center
            
            label.text = String(i + 1)
            
            self.view.addSubview(label)
            
        }
        
//        print(listOfDrawingPoint)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        parent?.view.frame.size.height = 200
        
        
        
        
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
