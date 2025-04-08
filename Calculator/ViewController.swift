//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTyping: Bool = true
    
    private var calculatorLogic: CalculatorLogic = CalculatorLogic()
    
    private var displayNumber: Double{
        get{
            guard let number = Double(displayLabel.text!) else{
                print("Not a number")
                return 0.0
            }
            return number
        }
        set{
            displayLabel.text = String(format: "%g", newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
        if let method = sender.currentTitle{
            calculatorLogic.setNumber(displayNumber)
            if let calculatedValue = calculatorLogic.calculate(operation: method){
                displayNumber = calculatedValue
            }
        }
        
        isFinishedTyping = true
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        //What should happen when a number is entered into the keypad
        
        if let label = sender.currentTitle{
            if isFinishedTyping{
                displayLabel.text = label
                isFinishedTyping = false
            } else {
                
                if label == "."{
                    
                    if displayLabel.text!.contains("."){
                        return
                    }
                    
                    let isInt = displayNumber.truncatingRemainder(dividingBy: 1) == 0
                    
                    if !isInt{
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + label
            }
        }
    }

}

