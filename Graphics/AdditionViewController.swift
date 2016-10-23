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
    @IBOutlet private weak var squareColorTableVIewCell: UITableViewCell?


    //MARK: - Variables
    weak var delegate: MainViewController?

    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        decorateUI()
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)

        navigationItem.title = "Назад"
    }

    func test(){

    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        navigationItem.title = "Новий трикутник"
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
        if triangleLenghtTextField?.text?.isEmpty == true || (xPositionTextField?.text?.isEmpty)! || (yPositionTextField?.text?.isEmpty)! {
            UIAlertView.showWithTitle("Помилка", message: "Заповніть, будь ласка, всі поля", handler: nil)

            return
        }

        guard let sideLenght = Double((triangleLenghtTextField?.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()))!) else{
            UIAlertView.showWithTitle("Помилка", message: "Сторона не може містити інших знаків, крім цифр та крапки", handler: nil)

            return
        }

        if sideLenght < 0 {
            UIAlertView.showWithTitle("Помилка", message: "Сторона не може бути від'ємною", handler: nil)

            return
        }

        if sideLenght > 32 {
            UIAlertView.showWithTitle("Помилка", message: "Ваш трикутник буде завеликим, зменшіть, будь ласка довжину сторони", handler: nil)

            return
        }

        guard let x = Double((xPositionTextField?.text)!) else {
            UIAlertView.showWithTitle("Помилка", message: "Точка Х містить зайві символи", handler: nil)

            return
        }

        if x > 15 || x < -15 {
            UIAlertView.showWithTitle("Помилка", message: "Точка Х не входить у рекомендовані межі, ваш трикутник не буде видимим", handler: nil)

            return
        }

        guard let y = Double((yPositionTextField?.text)!) else {
            UIAlertView.showWithTitle("Помилка", message: "Точка Y містить зайві символи", handler: nil)

            return
        }

        if y > 25 || x < -30 {
            UIAlertView.showWithTitle("Помилка", message: "Точка Y не входить у рекомендовані межі, ваш трикутник не буде видно", handler: nil)

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

    @IBAction func switchValueChanged(sender: UISwitch) {
        if sender.on {
            squareColorTableVIewCell?.hidden = false
        } else {
            squareColorTableVIewCell?.hidden = true
        }
    }
}
