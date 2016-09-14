//
//  AdditionViewController.swift
//  Graphics
//
//  Created by Andy Stef on 9/12/16.
//  Copyright © 2016 Andy Stef. All rights reserved.
//

import UIKit

class AdditionViewController: UITableViewController {
    static let storyboardId = "AddTriangleViewController"

    //MARK: - Outlets
    @IBOutlet private weak var triangleLenghtTextField: UITextField?
    @IBOutlet private weak var xPositionTextField: UITextField?
    @IBOutlet private weak var yPositionTextField: UITextField?
    @IBOutlet private weak var inscribedSquareSwitch: UISwitch?
    @IBOutlet private weak var triangleColorView: UIView?
    @IBOutlet private weak var squareColorView: UIView?
    @IBOutlet private weak var startVertexSwitch: UISegmentedControl?

    //MARK: - Variables
    weak var delegate: MainViewController?

    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        decorateUI()
    }

    func decorateUI() {
        navigationItem.title = "Новий трикутник"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Створити", style: .Done, target: self, action: #selector(AdditionViewController.createButtonPressed))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.blackColor()
        navigationItem.leftBarButtonItem?.tintColor = UIColor.blackColor()
        triangleColorView?.layer.borderColor = UIColor.grayColor().CGColor
        triangleColorView?.layer.borderWidth = 2.0
        squareColorView?.layer.borderColor = UIColor.grayColor().CGColor
        squareColorView?.layer.borderWidth = 2.0
    }
}

//MARK: - Actions and selectors 
extension AdditionViewController {
    @objc func createButtonPressed() {
        guard let sideLenght = Int((triangleLenghtTextField?.text)!) where Int((triangleLenghtTextField?.text)!) > 0 else{
            UIAlertView.showWithTitle("Упс", message: "Сторона не може бути від'ємною", handler: nil)

            return
        }

        guard let x = Double((xPositionTextField?.text)!), y = Double((yPositionTextField?.text)!) else {
            UIAlertView.showErrorWithMessage("Будьте добрі, введіть нормальну точку", handler: nil)

            return
        }

        delegate?.createTriangle(x, y: y, sideLenght: CGFloat(sideLenght), withInscribedSquare: inscribedSquareSwitch?.on ?? true, startVertex: VertexType(rawValue: startVertexSwitch?.selectedSegmentIndex ?? 0) ?? .bottomLeft)
        navigationController?.popViewControllerAnimated(true)
    }
}
