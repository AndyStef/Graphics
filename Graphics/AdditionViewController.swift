//
//  AdditionViewController.swift
//  Graphics
//
//  Created by Andy Stef on 9/12/16.
//  Copyright © 2016 Andy Stef. All rights reserved.
//

import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class AdditionViewController: UITableViewController {
    static let storyboardId = "AddTriangleViewController"

    //MARK: - Outlets
    @IBOutlet fileprivate weak var triangleLenghtTextField: UITextField?
    @IBOutlet fileprivate weak var xPositionTextField: UITextField?
    @IBOutlet fileprivate weak var yPositionTextField: UITextField?
    @IBOutlet fileprivate weak var inscribedSquareSwitch: UISwitch?
    @IBOutlet fileprivate weak var startVertexSwitch: UISegmentedControl?
    @IBOutlet fileprivate weak var triangleColorButton: UIButton?
    @IBOutlet fileprivate weak var squreColorButton: UIButton?

    //MARK: - Variables
    weak var delegate: MainViewController?

    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        decorateUI()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        navigationItem.title = "Назад"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationItem.title = "Новий трикутник"
    }

    func decorateUI() {
        navigationItem.title = "Новий трикутник"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Створити", style: .done, target: self, action: #selector(AdditionViewController.createButtonPressed))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        navigationItem.leftBarButtonItem?.tintColor = UIColor.black
        triangleColorButton?.layer.borderColor = UIColor.gray.cgColor
        triangleColorButton?.layer.borderWidth = 2.0
        squreColorButton?.layer.borderColor = UIColor.gray.cgColor
        squreColorButton?.layer.borderWidth = 2.0
        triangleColorButton?.backgroundColor = TriangleView.triangleFillColor
        squreColorButton?.backgroundColor = TriangleView.squareFillColor
    }
}

//MARK: - Actions and selectors 
extension AdditionViewController {
    @objc func createButtonPressed() {
        guard let sideLenght = Int((triangleLenghtTextField?.text)!) , Int((triangleLenghtTextField?.text)!) > 0 else{
            UIAlertView.show(withTitle: "Упс", message: "Сторона не може бути від'ємною", handler: nil)

            return
        }

        guard let x = Double((xPositionTextField?.text)!), let y = Double((yPositionTextField?.text)!) else {
            UIAlertView.showError(withMessage: "Будьте добрі, введіть нормальну точку", handler: nil)

            return
        }

        delegate?.createTriangle(x, y: y, sideLenght: CGFloat(sideLenght), withInscribedSquare: inscribedSquareSwitch?.isOn ?? true, startVertex: VertexType(rawValue: startVertexSwitch?.selectedSegmentIndex ?? 0) ?? .bottomLeft)
        navigationController?.popViewController(animated: true)
    }

    @IBAction func changeTriangleColorPressed(_ sender: AnyObject) {
        guard let colorPickerViewController = storyboard?.instantiateViewController(withIdentifier: ColorPickerViewController.storyboardId) as? ColorPickerViewController else {

            return
        }

        colorPickerViewController.innitialColor = TriangleView.triangleFillColor
        colorPickerViewController.isChoosingTriangleColor = true 
        colorPickerViewController.onChooseColorPressed = {
            self.triangleColorButton?.backgroundColor = TriangleView.triangleFillColor
        }
        navigationController?.pushViewController(colorPickerViewController, animated: true)
    }

    @IBAction func changeSquareColorPressed(_ sender: UIButton) {
        guard let colorPickerViewController = storyboard?.instantiateViewController(withIdentifier: ColorPickerViewController.storyboardId) as? ColorPickerViewController else {

            return
        }

        colorPickerViewController.innitialColor = sender.backgroundColor!
        colorPickerViewController.isChoosingSquareColor = true
        colorPickerViewController.onChooseColorPressed = {
            self.squreColorButton?.backgroundColor = TriangleView.squareFillColor
        }
        navigationController?.pushViewController(colorPickerViewController, animated: true)
    }
}
