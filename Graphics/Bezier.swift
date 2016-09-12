//
//  Bezier.swift
//  Graphics
//
//  Created by Andy Stef on 9/11/16.
//  Copyright © 2016 Andy Stef. All rights reserved.
//

import UIKit

@IBDesignable
class Bezier: UIView {


    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {

        let center: CGPoint = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)


        //polygon
        let polygonPath = UIBezierPath()
        polygonPath.moveToPoint(center)
        polygonPath.addLineToPoint(CGPointMake(center.x + 43.3, center.y - 25))
        polygonPath.addLineToPoint(CGPointMake(center.x + 43.3, center.y - 75))
        polygonPath.addLineToPoint(CGPointMake(center.x, center.y - 100))
        polygonPath.addLineToPoint(CGPointMake(center.x - 43.3, center.y - 75))
        polygonPath.addLineToPoint(CGPointMake(center.x - 43.3, center.y - 25))
        polygonPath.closePath()

        let greenColor = UIColor.greenColor()
        greenColor.setFill()
        let orangeColor = UIColor.orangeColor()
        orangeColor.setStroke()
        polygonPath.fill()
        polygonPath.lineWidth = 5.0
        
        polygonPath.stroke()



        // Drawing code
    }


}
