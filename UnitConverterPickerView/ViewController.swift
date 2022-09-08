//
//  ViewController.swift
//  UnitConverterPickerView
//
//  Created by mac on 06/09/22.
//

import UIKit

class ViewController: UIViewController,  UIPickerViewDelegate,UITextFieldDelegate, UIPickerViewDataSource {
    let quantities = ["Volume", "Length","Temperature"]
    var selectedQuantity : String = ""

    let volumeUnits = ["Gallons","Litres"]
    let lengthUnits = ["Foot","Yard"]
    let temperatureUnits = ["Celsius","Fahrenheit"]
    
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

    @objc(numberOfComponentsInPickerView:) func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView,numberOfRowsInComponent component: Int) -> Int {
        if currentTxtField == quantitySelectPickerView {
            return quantities.count
        }
        else if currentTxtField == fromPickerView {
            if selectedQuantity == "Volume" {
                return volumeUnits.count
            }
            else if selectedQuantity == "Length" {
                return lengthUnits.count
            }
            else if selectedQuantity == "Temperature" {
                return temperatureUnits.count
            }
            else {
                return 0
            }
        }
        else if currentTxtField == toPickerView {
            if selectedQuantity == "Volume" {
                return volumeUnits.count
            }
            else if selectedQuantity == "Length" {
                return lengthUnits.count
            }
            else if selectedQuantity == "Temperature" {
                return temperatureUnits.count
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
            return quantities[row]
        }
        else if currentTxtField == fromPickerView {
            if selectedQuantity == "Volume" {
                return volumeUnits[row]
            }
            else if selectedQuantity == "Length" {
                return lengthUnits[row]
            }
            else if selectedQuantity == "Temperature" {
                return temperatureUnits[row]
            }
            else {
                return ""
            }
        }
        else if currentTxtField == toPickerView {
            if selectedQuantity == "Volume"
            {
                return volumeUnits[row]
            }
            else if selectedQuantity == "Length"
            {
                return lengthUnits[row]
            }
            else if selectedQuantity == "Temperature" {
                return temperatureUnits[row]
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
            quantitySelectPickerView.text = quantities[row]
            fromPickerView.isEnabled = true
            toPickerView.isEnabled = true
            selectedQuantity = quantities[row]
            self.view.endEditing(true)
        }
        else if currentTxtField == fromPickerView {
            if selectedQuantity == "Volume"
            {
                fromPickerView.text = volumeUnits[row]
                
            }
            else if selectedQuantity == "Length"
            {
                fromPickerView.text = lengthUnits[row]
            }
            else if selectedQuantity == "Temperature"
            {
                fromPickerView.text = temperatureUnits[row]
            }
        }
        else if currentTxtField == toPickerView {
            if selectedQuantity == "Volume"
            {
                toPickerView.text = volumeUnits[row]
                
            }
            else if selectedQuantity == "Length"
            {
                toPickerView.text = lengthUnits[row]
            }
            else if selectedQuantity == "Temperature"
            {
                toPickerView.text = temperatureUnits[row]
            }
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
        resultTxtView.text = conversionManager.calculation(unitFrom: fromPickerView.text!, unitTo: toPickerView.text!, val: Double(inputTxtView.text!)!)
        
    }
}

