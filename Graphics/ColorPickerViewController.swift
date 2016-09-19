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

    @IBOutlet fileprivate weak var colorPickerView: SwiftHSVColorPicker?

    var onChooseColorPressed: (() -> ())?
    var innitialColor = UIColor.red
    var isChoosingTriangleColor = false
    var isChoosingSquareColor = false

    override func viewDidLoad() {
        super.viewDidLoad()

        colorPickerView?.setViewColor(innitialColor)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Вибрати колір", style: .done, target: self, action: #selector(ColorPickerViewController.chooseColorButtonPressed))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.black
    }
}

//MARK: - Actions and selectors
extension ColorPickerViewController {
    func chooseColorButtonPressed () {
        if isChoosingTriangleColor {
            TriangleView.triangleFillColor = colorPickerView?.color ?? UIColor()
        } else {
            TriangleView.squareFillColor = colorPickerView?.color ?? UIColor()
        }

        navigationController?.popViewController(animated: true)
        onChooseColorPressed?()
    }
}
