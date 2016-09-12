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

        let firstQuarterTriangle = drawTriangle(x: 20, y: 20, sideLenght: 100)
        view.addSubview(firstQuarterTriangle)

        let secondQuarterTriangle = drawTriangle(x: -75, y: 20, sideLenght: 40)
        view.addSubview(secondQuarterTriangle)

        let thirdQuarterTriangle = drawTriangle(x: -50, y: -125, sideLenght: 80)
        view.addSubview(thirdQuarterTriangle)

        let fourthQuarterTriangle = drawTriangle(x: 80, y: -75, sideLenght: 50)
        view.addSubview(fourthQuarterTriangle)
    }

    //MARK: - Drawing methods
    func drawTriangle(x x: CGFloat, y: CGFloat, sideLenght: CGFloat) -> TriangleView {
        let height = (sideLenght * sqrt(3.0)) / 2.0
        var triangle = TriangleView()

        switch (x, y) {
        case (0, 0):
            triangle = TriangleView(frame: CGRect(x: view.center.x, y: view.center.y - height, width: sideLenght, height: height))
        case (x, y) where x >= 0 && y >= 0:
            triangle = TriangleView(frame: CGRect(x: view.center.x + x + 1, y: view.center.y - height - y - 1, width: sideLenght, height: height))
        case (x, y) where x <= 0 && y >= 0:
            triangle = TriangleView(frame: CGRect(x: view.center.x + x - 2, y: view.center.y - height - y - 2, width: sideLenght, height: height))
        case (x, y) where x <= 0 && y <= 0:
            triangle = TriangleView(frame: CGRect(x: view.center.x + x - 2, y: view.center.y - height - y + 2, width: sideLenght, height: height))
        case (x, y) where x >= 0 && y <= 0:
            triangle = TriangleView(frame: CGRect(x: view.center.x + x + 1, y: view.center.y - height - y + 2, width: sideLenght, height: height))
        default:
            triangle = TriangleView()
        }
        return triangle
    }
}

//MARK: - Actions
extension MainViewController {
    @IBAction func addButtonPressed(sender: AnyObject) {
        guard let additionViewController = storyboard?.instantiateViewControllerWithIdentifier(AdditionViewController.storyboardId) else {

            return
        }
        
        navigationController?.pushViewController(additionViewController, animated: true)
    }
}
