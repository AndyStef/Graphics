//
//  UITextField.siwft.swift
//  Sound Glide
//
//  Created by user on 7/5/16.
//  Copyright © 2016 Sound Glide. All rights reserved.
//

import Foundation

extension UITextField {
    
    func useUnderline() {
        let border = CALayer()
        let borderWidth = CGFloat(1.0)
        border.borderColor = UIColor.blackColor().CGColor
        border.frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width, self.frame.size.height)
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func addLeftPadding() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = view
        self.leftViewMode = UITextFieldViewMode.Always
    }

    func customize() {
        useUnderline()
        self.setValue(UIColor(colorLiteralRed: 0.21, green: 0.21, blue: 0.21, alpha: 1), forKeyPath: "_placeholderLabel.textColor")
    }
}

