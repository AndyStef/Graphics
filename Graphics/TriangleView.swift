//
//  TriangleView.swift
//  Graphics
//
//  Created by Andy Stef on 9/7/16.
//  Copyright © 2016 Andy Stef. All rights reserved.
//

import Foundation
import UIKit

class TriangleView: UIView {
    static var fillColor: UIColor = UIColor(red: 0.15, green: 0.59, blue: 0.58, alpha: 1.00)

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = UIColor.clearColor()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func drawRect(rect: CGRect) {
        let ctx: CGContextRef = UIGraphicsGetCurrentContext()!
        CGContextBeginPath(ctx)
        CGContextMoveToPoint(ctx, CGRectGetMinX(rect), CGRectGetMaxY(rect))
        CGContextAddLineToPoint(ctx, CGRectGetMidX(rect), CGRectGetMinY(rect))
        CGContextAddLineToPoint(ctx, (CGRectGetMaxX(rect)), CGRectGetMaxY(rect))
        CGContextClosePath(ctx)
        CGContextSetFillColorWithColor(ctx, TriangleView.fillColor.CGColor)
        CGContextFillPath(ctx)
    }
}
