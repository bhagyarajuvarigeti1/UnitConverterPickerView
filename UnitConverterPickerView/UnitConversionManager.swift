//
//  UnitConversionManager.swift
//  UnitConverterPickerView
//
//  Created by mac on 07/09/22.
//

import UIKit

class UnitConversionManager: UIViewController {

    func calculation(unitFrom: String, unitTo: String, val: Double) -> String {
        print("-===========-")
        print(unitFrom)
        print(unitTo)
        print(val)
        print("-===========-")
        if unitFrom == unitTo {
            return "Invalid Converstion"
        }
        else if unitFrom == "Celsius" && unitTo == "Fahrenheit" {
            let result = round((val * (9/5)) + 32)
            return String(result)
        }
        else if unitTo == "Celsius" && unitFrom == "Fahrenheit" {
            let result = round((val - 32)*5/9)
            return String(result)
        }
        else if unitFrom == "Foot" && unitTo == "Yard" {
            let result = round(val*3)
            return String(result)
        }
        else if unitTo == "Foot" && unitFrom == "Yard" {
            let result = round(val/3)
            return String(result)
        }
        else if unitFrom == "Gallons" && unitTo == "Litres" {
            let result = round(val*3.78541)
            return String(result)
        }
        else if unitTo == "Gallons" && unitFrom == "Litres" {
            let result = round(val/3.78541)
            return String(result)
        }
        else{
            return "Wrong !"
        }
    }

}
