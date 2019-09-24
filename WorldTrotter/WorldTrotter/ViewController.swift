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

    @IBOutlet weak var FahrenheitTextField: UITextField!
    @IBOutlet var celsiusLabel: UILabel!
    var formatter: NumberFormatter = {
        let fmt = NumberFormatter()
        fmt.numberStyle = .decimal
            fmt.minimumFractionDigits = 0
            fmt.maximumFractionDigits = 1
            return fmt
    }()
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet{
            if let celsiusValue = celsiusValue{
                celsiusLabel.text = formatter.string(from: NSNumber(value: celsiusValue.value))
            } else {
                celsiusLabel.text = "???"
            }
            
        }
    }
    
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    @IBAction func fahrenheitFieldChange(_ sender: UITextField) {
        if let text = sender.text, !text.isEmpty, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            celsiusLabel.text = "???"
        }
        print("Text = \(sender.text)")
    }
    
    @IBAction func TapDetected(_ sender: UITapGestureRecognizer) {
        FahrenheitTextField.resignFirstResponder()
    }
}

