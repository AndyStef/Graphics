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
    @IBOutlet private weak var triangleLenghtTexyField: UITextField?
    @IBOutlet private weak var xPositionTextField: UITextField?
    @IBOutlet private weak var yPositionTextField: UITextField?

    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Новий трикутник"
    }
}
