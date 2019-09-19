//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Mudrack, Cody M on 9/17/19.
//  Copyright © 2019 Mudrack, Cody M. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBOutlet var celsiusLabel: UILabel!
    @IBAction func fahrenheitFieldChange(_ sender: UITextField) {
        print("Text = \(sender.text)")
    }
    

}

