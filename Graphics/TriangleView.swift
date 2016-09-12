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
        CGContextSetRGBFillColor(ctx, 1, 0.5, 0, 0.6)
        CGContextFillPath(ctx)
    }
}
