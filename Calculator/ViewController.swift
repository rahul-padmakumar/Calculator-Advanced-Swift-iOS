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
    
    private var displayNumber: Double{
        get{
            guard let number = Double(displayLabel.text!) else{
                print("Not a number")
                return 0.0
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        print(sender.currentTitle!)
        //What should happen when a non-number button is pressed
        if let method = sender.currentTitle{
            if method == "AC"{
                displayNumber = 0
            } else if method == "+/-"{
                displayNumber *= -1
            } else if method == "%"{
                displayNumber *= 0.01
            }
        }
        
        isFinishedTyping = true
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        print(sender.currentTitle!)
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
                    
                    print("Floor - \(floor(displayNumber)), \(displayNumber)")
                    
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

