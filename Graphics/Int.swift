//
//  Int.swift
//  Graphics
//
//  Created by Andy Stef on 9/21/16.
//  Copyright © 2016 Andy Stef. All rights reserved.
//

import Foundation

extension Int {
    var degreesToRadians: CGFloat {
        return CGFloat(self) * CGFloat(M_PI) / 180
    }
}
