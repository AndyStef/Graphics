//
//  ColorPickerViewController.swift
//  Graphics
//
//  Created by Andy Stef on 9/17/16.
//  Copyright © 2016 Andy Stef. All rights reserved.
//

import UIKit
import SwiftHSVColorPicker

class ColorPickerViewController: UIViewController {
    static let storyboardId = "ColorPickerViewController"

    @IBOutlet private weak var colorPickerView: SwiftHSVColorPicker?

    var onChooseColorPressed: (() -> ())?
    var innitialColor = UIColor?()
    var isChoosingTriangleColor = false
    var isChoosingSquareColor = false

    override func viewDidLoad() {
        super.viewDidLoad()

        if let color = innitialColor {
            colorPickerView?.setViewColor(color)
        }
    }
}

//MARK: - Actions
extension ColorPickerViewController {
    @IBAction func chooseColorButtonPressed(sender: AnyObject) {
        if isChoosingTriangleColor {
            TriangleView.triangleFillColor = colorPickerView?.color ?? UIColor()
        } else {
            TriangleView.squareFillColor = colorPickerView?.color ?? UIColor()
        }

        navigationController?.popViewControllerAnimated(true)
        onChooseColorPressed?()
    }
}