//
//  ViewController.swift
//  HelloWorldInClass
//
//  Created by admin on 07/02/2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var Submit: UIButton!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func Submit(_ sender: Any) {
        if let name = textField.text {
            Label.text = "Hello \(name)"
        }
    }
    
}

