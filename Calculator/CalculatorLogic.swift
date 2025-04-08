//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Rahul Padmakumar on 08/04/25.
//  Copyright © 2025 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic{
    
    private var number: Double?
    
    private var operationTuple: (number: Double, operation: String)?
    
    mutating func setNumber(_ number: Double){
        self.number = number
    }
    
    mutating func calculate(operation: String) -> Double?{
        if let safeNumber = number{
            switch operation{
            case "AC":
                return 0
            case "+/-":
                return (safeNumber * -1)
            case "%":
                return (safeNumber * 0.01)
            case "+","×","÷","-":
                operationTuple = (number: safeNumber, operation: operation)
                return nil
            case "=":
                return performOperation(safeNumber)
            default:
                return nil
            }
        }
        return nil
    }
    
    private func performOperation(_ number2: Double) -> Double?{
        if let number1 = operationTuple?.number,
           let operation = operationTuple?.operation{
            switch operation{
            case "+": return number1 + number2
            case "-": return number1 - number2
            case "×": return number1 * number2
            case "÷": return number1 / number2
            default: return nil
            }
        }
        return nil
    }
}
