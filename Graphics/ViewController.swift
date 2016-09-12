//
//  ViewController.swift
//  Graphics
//
//  Created by Andy Stef on 9/7/16.
//  Copyright © 2016 Andy Stef. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func rotateButtonPressed(sender: AnyObject) {

    }


    @IBAction func action(sender: AnyObject) {

        let y = (120 * sqrt(3.0))/2
        print(y)

        let triangle = TriangleView(frame: CGRect(x: 200, y: 250, width: 120, height: y))

        triangle.backgroundColor = UIColor.clearColor()

        view.addSubview(triangle)


       // let x = ((100 * sqrt(3.0))/3)

      //  print(x)

        let x = (120.0 * 46.0) / 100.0


//100  -  46
//120  -  x

  //      x = (120/46) * 100


        let square = UIView(frame: CGRect(x: 30, y: 20 + 20 + 29, width: x, height: x))//46

        square.backgroundColor = UIColor.greenColor()

        view.addSubview(square)

        square.center.x = triangle.center.x
        //square.center.y = triangle.center.y
//        let test = UIView(frame: CGRect()
    }


    @IBOutlet private weak var triangle: TriangleView?

    override func viewDidLoad() {
        super.viewDidLoad()

        



//        let triangle = TriangleView(frame: CGRectMake(40, 20, 250, 250))
//        triangle.backgroundColor = UIColor.whiteColor()
//        view.addSubview(triangle)

//        let firstLine = UIView(frame: CGRectMake(150, 200, 100, 1))
//        firstLine.backgroundColor = UIColor.blackColor()
//        view.addSubview(firstLine)
//
//        firstLine.transform = CGAffineTransformMakeRotation(45)
//
//
//        let secondLine = UIView(frame: CGRectMake(CGRectGetMaxX(firstLine.frame), CGRectGetMaxY(firstLine.frame), 100, 1))
//
//        secondLine.backgroundColor = UIColor.blackColor()
//
//        view.addSubview(secondLine)
//
//        secondLine.frame.origin = CGPoint(x: secondLine.frame.origin.x - 100, y: secondLine.frame.origin.y)
//
//        let thirdLine = UIView(frame: CGRectMake(secondLine.frame.origin.x, secondLine.frame.origin.y, 100, 1))
//
//        thirdLine.backgroundColor = UIColor.redColor()
//
//        view.addSubview(thirdLine)
//
//   //     thirdLine.transform = CGAffineTransformMakeRotation(30)
//
//        thirdLine.frame.origin = CGPoint(x: secondLine.frame.origin.x - 25, y: thirdLine.frame.origin.y - 42)
//
//        thirdLine.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_4 + M_PI_4 + M_2_PI))











        let testLine = UIView(frame: CGRect(x: 150, y: 400, width: 100, height: 1))

        testLine.backgroundColor = UIColor.greenColor()

        view.addSubview(testLine)

        testLine.transform = CGAffineTransformMakeRotation(CGFloat( M_PI/3))

        let testLine2 = UIView(frame: CGRect(x: CGRectGetMaxX(testLine.frame), y: CGRectGetMaxY(testLine.frame), width: 100, height: 1))

        testLine2.backgroundColor = UIColor.greenColor()

        view.addSubview(testLine2)

        testLine2.frame.origin = CGPoint(x: testLine2.frame.origin.x - 100, y: testLine2.frame.origin.y)

        let testLine3 = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 1))

        testLine3.backgroundColor = UIColor.redColor()

        view.addSubview(testLine3)

        testLine3.frame.origin = CGPoint(x: testLine2.frame.origin.x, y: testLine2.frame.origin.y)

        testLine3.transform = CGAffineTransformMakeRotation(CGFloat(-(M_PI/3)))

        testLine3.center.x = testLine2.frame.origin.x + 24
        testLine3.center.y = testLine2.frame.origin.y - 43


//        let testView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: y))
//
//        testView.backgroundColor = UIColor.redColor()
//
//        view.addSubview(testView)





       // triangle.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))











        //view.setNeedsDisplay()



//        let ctx: CGContextRef = UIGraphicsGetCurrentContext()!
//        CGContextBeginPath(ctx)
//        CGContextMoveToPoint(ctx, CGRectGetMinX(testLine.frame), CGRectGetMinY(testLine.frame))
//        CGContextAddLineToPoint(ctx, CGRectGetMaxX(testLine.frame), CGRectGetMaxY(testLine.frame))
//        CGContextAddLineToPoint(ctx, (CGRectGetMinX(testLine2.frame)), CGRectGetMaxY(testLine2.frame))
//        CGContextClosePath(ctx)
//        CGContextSetRGBFillColor(ctx, 1, 0.5, 0, 0.6)
//        CGContextFillPath(ctx)

    }

}

