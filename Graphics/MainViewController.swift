//
//  TestViewController.swift
//  Graphics
//
//  Created by Andy Stef on 9/18/16.
//  Copyright © 2016 Andy Stef. All rights reserved.
//

import UIKit

protocol AdditionViewControllerDelegate: class {
    func createTriangle(x: Double, y: Double, sideLenght: CGFloat, withInscribedSquare: Bool, startVertex: VertexType)
}

class MainViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var mainView: UIView?

    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView?.minimumZoomScale = 1.0
        scrollView?.maximumZoomScale = 6.0
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)

        navigationItem.title = "Назад"
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        navigationItem.title = "Рівносторонні трикутники"
    }

    //MARK: - Drawing methods
    func drawTriangle(x x: CGFloat, y: CGFloat, sideLenght: CGFloat) -> TriangleView {
        let height = (sideLenght * sqrt(3.0)) / 2.0
        var triangle = TriangleView()

        switch (x, y) {
        case (0, 0):
            triangle = TriangleView(frame: CGRect(x: scrollView.center.x , y: scrollView.center.y - height, width: sideLenght, height: height))
        case (x, y) where x >= 0 && y >= 0:
            triangle = TriangleView(frame: CGRect(x: scrollView.center.x + x + (x/10), y: scrollView.center.y - height - y - (y/10), width: sideLenght, height: height))
        case (x, y) where x <= 0 && y >= 0:
            triangle = TriangleView(frame: CGRect(x: scrollView.center.x + x + (x/10) - 1, y: scrollView.center.y - height - y - (y/10), width: sideLenght, height: height))
        case (x, y) where x <= 0 && y <= 0:
            triangle = TriangleView(frame: CGRect(x: scrollView.center.x + x + (x/10) - 1, y: scrollView.center.y - height - y - (y/10), width: sideLenght, height: height))
        case (x, y) where x >= 0 && y <= 0:
            triangle = TriangleView(frame: CGRect(x: scrollView.center.x + x + (x/10), y: scrollView.center.y - height - y - (y/10), width: sideLenght, height: height))
        default:
            triangle = TriangleView()
        }
        return triangle
    }

    func drawSquare(sideOfTriangle: CGFloat, triangle: TriangleView) {
        let heigth = (sideOfTriangle * sqrt(3.0)) / 2
        let sideOfSquare = (heigth * sideOfTriangle) / (heigth + sideOfTriangle)
        let square = UIView(frame: CGRect(x: triangle.center.x - (sideOfSquare / 2), y: triangle.frame.origin.y + heigth - sideOfSquare, width: sideOfSquare, height: sideOfSquare))
        square.backgroundColor = TriangleView.squareFillColor
        mainView?.addSubview(square)
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
}

//MARK: - AdditionViewControllerDelegate
extension MainViewController: AdditionViewControllerDelegate {
    func createTriangle(x: Double, y: Double, sideLenght: CGFloat, withInscribedSquare: Bool, startVertex: VertexType) {
        var triangle = TriangleView()
        let height = (sideLenght * sqrt(3.0)) / 2.0

        switch startVertex {
        case .bottomLeft:
            triangle = drawTriangle(x: CGFloat(x) * 10, y: CGFloat(y) * 10, sideLenght: sideLenght * 11)
        case .bottomRight:
            triangle = drawTriangle(x: (CGFloat(x) - sideLenght) * 10, y: CGFloat(y) * 10, sideLenght: sideLenght * 11)
        case .top:
            triangle = drawTriangle(x: (CGFloat(x) - (sideLenght/2)) * 10 + 1, y: (CGFloat(y) - height) * 10, sideLenght: sideLenght * 11)
        }

        mainView?.addSubview(triangle)
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(MainViewController.handleTriangleTap))
//        triangle.addGestureRecognizer(tapGesture)
        if withInscribedSquare {
            drawSquare(sideLenght * 11, triangle: triangle)
        }
    }
}

//MARK: - UIScrollViewDelegate
extension MainViewController: UIScrollViewDelegate {
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return mainView
    }
}


