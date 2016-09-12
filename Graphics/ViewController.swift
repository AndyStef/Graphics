//
//  ViewController.swift
//  Graphics
//
//  Created by Andy Stef on 9/7/16.
//  Copyright © 2016 Andy Stef. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet private weak var firstQuarterView: UIView?
    @IBOutlet private weak var secondQuarterView: UIView?
    @IBOutlet private weak var thirdQuarterView: UIView?
    @IBOutlet private weak var fourthQuarterView: UIView?

    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        let triangle = drawTriangle(x: 20, y: 10, sideLenght: 100)
        view.addSubview(triangle)
    }

    //MARK: - Drawing methods
    func drawTriangle(x x: CGFloat, y: CGFloat, sideLenght: CGFloat) -> TriangleView {
        let height = (sideLenght * sqrt(3.0)) / 2.0
        let triangle = TriangleView(frame: CGRect(x: view.center.x + x + 1, y: view.center.y - height - y - 1, width: sideLenght, height: height))
        return triangle
    }
}
