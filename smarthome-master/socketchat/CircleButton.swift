//
//  CircleButton.swift
//  socketchat
//
//  Created by admin on 2018/7/11.
//  Copyright © 2018年 Simon Chang. All rights reserved.
//

import UIKit

class CircleButton: UIButton {
    
    override func awakeFromNib() {
        drawCircleMsak()
        if isOutterCircle {
            self.layer.addSublayer(drawOutterCircle())
        }
    }
    
    
    
    @IBInspectable public var maskWidth: CGFloat = 10
    @IBInspectable public var outerColor: UIColor = UIColor.black
    @IBInspectable public var outerwidth: CGFloat = 1
    @IBInspectable public var isOutterCircle: Bool = false
    @IBInspectable public var selectHighLight: Bool = true {
        didSet {
            self.adjustsImageWhenHighlighted = selectHighLight
        }
    }
    
    
    
    private var innerRadius: CGFloat! {
        let height = self.bounds.size.height
        let width = self.bounds.size.width
        return (width <= height)  ? ((width / 2) - maskWidth) : ((height / 2) - maskWidth)
    }
    
    private var outterRadius: CGFloat! {
        let height = self.bounds.size.height
        let width = self.bounds.size.width
        return (width <= height)  ? ((width / 2) + outerwidth) : ((height / 2) + outerwidth)
    }
    
    func drawOutterCircle() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.addArc(
            withCenter: CGPoint(x: self.bounds.size.width / 2, y: self.bounds.size.height / 2),
            radius: innerRadius,
            startAngle: 0,
            endAngle: 2 * CGFloat.pi,
            clockwise: true)
        shapeLayer.strokeColor = outerColor.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = outerwidth
        shapeLayer.path = linePath.cgPath
        return shapeLayer
    }
    func drawCircleMsak() {
        
        let shapeLayer = CAShapeLayer()
        let linePath = UIBezierPath()
        var innerRadius: CGFloat!
        if self.bounds.size.width < self.bounds.size.height {
            innerRadius = self.bounds.size.width / 2 - maskWidth
        }else if self.bounds.size.width >= self.bounds.size.height{
            innerRadius = self.bounds.size.height / 2 - maskWidth
        }
        
        linePath.addArc(
            withCenter: CGPoint(x: self.bounds.size.width / 2, y: self.bounds.size.height / 2),
            radius: innerRadius,
            startAngle: 0,
            endAngle: 2 * CGFloat.pi,
            clockwise: true)
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.fillColor = UIColor.black.cgColor
        shapeLayer.path = linePath.cgPath
        self.layer.mask = shapeLayer
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
