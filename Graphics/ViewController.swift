//
//  ViewController.swift
//  Graphics
//
//  Created by Andy Stef on 9/7/16.
//  Copyright © 2016 Andy Stef. All rights reserved.
//

import UIKit

protocol AdditionViewControllerDelegate: class {
    func createTriangle(x: Double, y: Double, sideLenght: CGFloat, withInscribedSquare: Bool)
}

class MainViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet private weak var firstQuarterView: UIView?
    @IBOutlet private weak var secondQuarterView: UIView?
    @IBOutlet private weak var thirdQuarterView: UIView?
    @IBOutlet private weak var fourthQuarterView: UIView?

    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - Drawing methods
    func drawTriangle(x x: CGFloat, y: CGFloat, sideLenght: CGFloat) -> TriangleView {
        let height = (sideLenght * sqrt(3.0)) / 2.0
        var triangle = TriangleView()

        switch (x, y) {
        case (0, 0):
            triangle = TriangleView(frame: CGRect(x: view.center.x, y: view.center.y - height, width: sideLenght, height: height))
        case (x, y) where x >= 0 && y >= 0:
            triangle = TriangleView(frame: CGRect(x: view.center.x + x + (x/10), y: view.center.y - height - y - (y/10), width: sideLenght, height: height))
        case (x, y) where x <= 0 && y >= 0:
            triangle = TriangleView(frame: CGRect(x: view.center.x + x + (x/10) - 1, y: view.center.y - height - y - (y/10), width: sideLenght, height: height))
        case (x, y) where x <= 0 && y <= 0:
            triangle = TriangleView(frame: CGRect(x: view.center.x + x + (x/10) - 1, y: view.center.y - height - y - (y/10), width: sideLenght, height: height))
        case (x, y) where x >= 0 && y <= 0:
            triangle = TriangleView(frame: CGRect(x: view.center.x + x + (x/10), y: view.center.y - height - y - (y/10), width: sideLenght, height: height))
        default:
            triangle = TriangleView()
        }
        return triangle
    }


    func drawSquare(sideOfTriangle: CGFloat, triangle: TriangleView) {
        let heigth = (sideOfTriangle * sqrt(3.0)) / 2
        let sideOfSquare = (heigth * sideOfTriangle) / (heigth + sideOfTriangle)
        let square = UIView(frame: CGRect(x: triangle.center.x - (sideOfSquare / 2), y: triangle.frame.origin.y + heigth - sideOfSquare, width: sideOfSquare, height: sideOfSquare))
        square.backgroundColor = UIColor.redColor()
        view.addSubview(square)
    }
}

//MARK: - Actions and selectors
extension MainViewController {
    @IBAction func addButtonPressed(sender: AnyObject) {
        guard let additionViewController = storyboard?.instantiateViewControllerWithIdentifier(AdditionViewController.storyboardId) as? AdditionViewController else {

            return
        }

        additionViewController.delegate = self
        navigationController?.pushViewController(additionViewController, animated: true)
    }

    @objc func handleTriangleTap() {
        print("tapped triangle")
    }
}

//MARK: - AdditionViewControllerDelegate
extension MainViewController: AdditionViewControllerDelegate {
    func createTriangle(x: Double, y: Double, sideLenght: CGFloat, withInscribedSquare: Bool) {
        let triangle = drawTriangle(x: CGFloat(x) * 10, y: CGFloat(y) * 10, sideLenght: sideLenght * 10)
        view.addSubview(triangle)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(MainViewController.handleTriangleTap))
        triangle.addGestureRecognizer(tapGesture)
        if withInscribedSquare {
            drawSquare(sideLenght * 10, triangle: triangle)
        }
    }
}
