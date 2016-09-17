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
    @IBOutlet private weak var startVertexSwitch: UISegmentedControl?
    @IBOutlet private weak var triangleColorButton: UIButton?
    @IBOutlet private weak var squreColorButton: UIButton?

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
        triangleColorButton?.layer.borderColor = UIColor.grayColor().CGColor
        triangleColorButton?.layer.borderWidth = 2.0
        squreColorButton?.layer.borderColor = UIColor.grayColor().CGColor
        squreColorButton?.layer.borderWidth = 2.0
        triangleColorButton?.backgroundColor = TriangleView.triangleFillColor
        squreColorButton?.backgroundColor = TriangleView.squareFillColor
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

    @IBAction func changeTriangleColorPressed(sender: AnyObject) {
        guard let colorPickerViewController = storyboard?.instantiateViewControllerWithIdentifier(ColorPickerViewController.storyboardId) as? ColorPickerViewController else {

            return
        }

        colorPickerViewController.innitialColor = TriangleView.triangleFillColor
        colorPickerViewController.isChoosingTriangleColor = true 
        colorPickerViewController.onChooseColorPressed = {
            self.triangleColorButton?.backgroundColor = TriangleView.triangleFillColor
        }
        navigationController?.pushViewController(colorPickerViewController, animated: true)
    }

    @IBAction func changeSquareColorPressed(sender: UIButton) {
        guard let colorPickerViewController = storyboard?.instantiateViewControllerWithIdentifier(ColorPickerViewController.storyboardId) as? ColorPickerViewController else {

            return
        }

        colorPickerViewController.innitialColor = sender.backgroundColor
        colorPickerViewController.isChoosingSquareColor = true
        colorPickerViewController.onChooseColorPressed = {
            self.squreColorButton?.backgroundColor = TriangleView.squareFillColor
        }
        navigationController?.pushViewController(colorPickerViewController, animated: true)
    }
}
