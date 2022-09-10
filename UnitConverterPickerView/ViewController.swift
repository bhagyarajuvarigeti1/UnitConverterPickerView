//
//  ViewController.swift
//  UnitConverterPickerView
//
//  Created by mac on 06/09/22.
//

import UIKit

class ViewController: UIViewController,  UIPickerViewDelegate,UITextFieldDelegate, UIPickerViewDataSource {
    
    let constant = Constants()
    
//    let quantities = ["Volume", "Length","Temperature"]
//    var selectedQuantity : String = ""
//
//    let volumeUnits = ["Gallons","Litres"]
//    let lengthUnits = ["Foot","Yard"]
//    let temperatureUnits = ["Celsius","Fahrenheit"]
    @IBOutlet weak var quantitySelectPickerView: UITextField!
    @IBOutlet weak var fromPickerView: UITextField!
    @IBOutlet weak var toPickerView: UITextField!
    @IBOutlet weak var inputTxtView: UITextField!
    @IBOutlet weak var resultTxtView: UITextField!
    
    var pickerView = UIPickerView()
    var currentTxtField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fromPickerView.tintColor = UIColor.clear
        toPickerView.tintColor = UIColor.clear
        quantitySelectPickerView.tintColor = UIColor.clear
        fromPickerView.isEnabled = false
        toPickerView.isEnabled = false
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView,numberOfRowsInComponent component: Int) -> Int {
        if currentTxtField == quantitySelectPickerView {
            return constant.quantities.count
        }
        else if currentTxtField == fromPickerView {
            if constant.selectedQuantity == constant.quantities[0] {
                return constant.volumeUnits.count
            }
            else if constant.selectedQuantity == constant.quantities[1] {
                return constant.lengthUnits.count
            }
            else if constant.selectedQuantity == constant.quantities[2] {
                return constant.temperatureUnits.count
            }
            else {
                return 0
            }
        }
        else if currentTxtField == toPickerView {
            if constant.selectedQuantity == "Volume" {
                return constant.volumeUnits.count
            }
            else if constant.selectedQuantity == "Length" {
                return constant.lengthUnits.count
            }
            else if constant.selectedQuantity == "Temperature" {
                return constant.temperatureUnits.count
            }
            else {
                return 0
            }
        }
        else {
            return 0
        }

    }
    
    func pickerView(_ pikcerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if currentTxtField == quantitySelectPickerView {
            return constant.quantities[row]
        }
        else if currentTxtField == fromPickerView {
            if constant.selectedQuantity == "Volume" {
                return constant.volumeUnits[row]
            }
            else if constant.selectedQuantity == "Length" {
                return constant.lengthUnits[row]
            }
            else if constant.selectedQuantity == "Temperature" {
                return constant.temperatureUnits[row]
            }
            else {
                return ""
            }
        }
        else if currentTxtField == toPickerView {
            if constant.selectedQuantity == "Volume"
            {
                return constant.volumeUnits[row]
            }
            else if constant.selectedQuantity == "Length"
            {
                return constant.lengthUnits[row]
            }
            else if constant.selectedQuantity == "Temperature" {
                return constant.temperatureUnits[row]
            }
            else {
                return ""
            }
        }
        else {
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if currentTxtField == quantitySelectPickerView {
            quantitySelectPickerView.text = constant.quantities[row]
            fromPickerView.isEnabled = true
            toPickerView.isEnabled = true
            constant.selectedQuantity = constant.quantities[row]
            self.view.endEditing(true)
        }
        else if currentTxtField == fromPickerView {
            if constant.selectedQuantity == "Volume"
            {
                fromPickerView.text = constant.volumeUnits[row]
                
            }
            else if constant.selectedQuantity == "Length"
            {
                fromPickerView.text = constant.lengthUnits[row]
            }
            else if constant.selectedQuantity == "Temperature"
            {
                fromPickerView.text = constant.temperatureUnits[row]
            }
            self.view.endEditing(true)
        }
        else if currentTxtField == toPickerView {
            if constant.selectedQuantity == "Volume"
            {
                toPickerView.text = constant.volumeUnits[row]
                
            }
            else if constant.selectedQuantity == "Length"
            {
                toPickerView.text = constant.lengthUnits[row]
            }
            else if constant.selectedQuantity == "Temperature"
            {
                toPickerView.text = constant.temperatureUnits[row]
            }
            self.view.endEditing(true)
        }
        
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        currentTxtField = textField
        if currentTxtField == quantitySelectPickerView {
            currentTxtField.inputView = pickerView
        }
        else if currentTxtField == fromPickerView {
            currentTxtField.inputView = pickerView
        }
        else if currentTxtField == toPickerView {
            currentTxtField.inputView = pickerView
        }
    }
    
    @IBAction func convertBtn(_ sender: Any) {
        let conversionManager = UnitConversionManager()
        do {
            guard let tempInputTxtView = inputTxtView.text else {
                throw UnitConversionError.InvalidUnitConversion
            }
            resultTxtView.text = try conversionManager.calculation(unitFrom: fromPickerView.text!, unitTo: toPickerView.text!, value: tempInputTxtView)
        }
        catch let error {
            if let error = error as? UnitConversionError, error == UnitConversionError.InvalidUnitConversion {
                resultTxtView.text = "Invalid Units are selected"
            }
        }
        fromPickerView.text = ""
        toPickerView.text = ""
    }
}
