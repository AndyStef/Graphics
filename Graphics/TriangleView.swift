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
    static var triangleFillColor: UIColor = UIColor(red: 0.15, green: 0.59, blue: 0.58, alpha: 1.00)
    static var squareFillColor: UIColor = UIColor(red: 0.88, green: 0.13, blue: 0.24, alpha: 1.00)

    var square: UIView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = UIColor.clear
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {
        let ctx: CGContext = UIGraphicsGetCurrentContext()!
        ctx.beginPath()
        ctx.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        ctx.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        ctx.addLine(to: CGPoint(x: (rect.maxX), y: rect.maxY))
        ctx.closePath()
        ctx.setFillColor(TriangleView.triangleFillColor.cgColor)
        ctx.fillPath()
    }

    func removeTriangle() {
        self.removeFromSuperview()
        self.square.removeFromSuperview()
    }
}
