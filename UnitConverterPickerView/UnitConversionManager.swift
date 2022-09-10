//
//  UnitConversionManager.swift
//  UnitConverterPickerView
//
//  Created by mac on 07/09/22.
//

import UIKit

class UnitConversionManager: UIViewController {
    
    func calculation(unitFrom: String, unitTo: String, value: String) throws -> String {
        print("-===========-")
        print(unitFrom)
        print(unitTo)
        print(value)
        print("-===========-")
        let val = Double(value)
        if unitFrom == unitTo {
            return value
        }
        
        if unitFrom == "Celsius" && unitTo == "Fahrenheit" {
            let result = round((val! * (9/5)) + 32)
            return String(result)
        }
        
        if unitFrom == "Fahrenheit" && unitTo == "Celsius"{
            let result = round((val! - 32)*5/9)
            return String(result)
        }
        
        if unitFrom == "Foot" && unitTo == "Yard" {
            let result = round(val! * 3)
            return String(result)
        }
        
        if unitFrom == "Yard" && unitTo == "Foot" {
            let result = round(val!/3)
            return String(result)
        }
        
        if unitFrom == "Gallons" && unitTo == "Litres" {
            let result = round(val!*3.78541)
            return String(result)
        }
        
        if unitFrom == "Litres" && unitTo == "Gallons" {
            let result = round(val!/3.78541)
            return String(result)
        }
        
        throw UnitConversionError.InvalidUnitConversion
    }
}

class Constants : UIViewController {
    
    let quantities = ["Volume", "Length","Temperature"]
    var selectedQuantity : String = ""
    
    let volumeUnits = ["Gallons","Litres"]
    let lengthUnits = ["Foot","Yard"]
    let temperatureUnits = ["Celsius","Fahrenheit"]
    
}
