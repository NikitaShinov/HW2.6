//
//  SettingsViewController.swift
//  HW2.6
//
//  Created by Никита Шинов on 06.11.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var settingsView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    var mainScreenColour: UIColor!
    var delegate: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsView.layer.cornerRadius = 15
        settingsView.backgroundColor = mainScreenColour
        
//        redSlider.value = 0.5
//        greenSlider.value = 0.5
//        blueSlider.value = 0.5
        
        redSlider.thumbTintColor = .red
        greenSlider.thumbTintColor = .green
        blueSlider.thumbTintColor = .blue
        
        setValuesForLabels()
        setValuesForTextFields()
        setValueForSliders()
        
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            redLabel.text = String(format: "%.2f", redSlider.value)
            redTextField.text = String(format: "%.2f", redSlider.value)
        case 1:
            greenLabel.text = String(format: "%.2f", greenSlider.value)
            greenTextField.text = String(format: "%.2f", greenSlider.value)
        case 2:
            blueLabel.text = String(format: "%.2f", blueSlider.value)
            blueTextField.text = String(format: "%.2f", blueSlider.value)
        default:
            break
        }
        settingsViewResult()
        }
    

    @IBAction func textFieldValueChanged(_ sender: UITextField) {
        switch sender.tag {
        case 0:
            guard let text = sender.text else { return }
            if let textValue = Float(text) {
                redSlider.value = textValue
                redLabel.text = String(format: "%.2f",textValue)
            } else {
                showAlert()
            }
        case 1:
            guard let text = sender.text else { return }
            if let textValue = Float(text) {
                greenSlider.value = textValue
                greenLabel.text = String(format: "%.2f",textValue)
            } else {
                showAlert()
            }
        case 2:
            guard let text = sender.text else { return }
            if let textValue = Float(text) {
                blueSlider.value = textValue
                blueLabel.text = String(format: "%.2f",textValue)
            } else {
                showAlert()
            }
        default:
            break
        }
        settingsViewResult()
    }
    
    @IBAction func doneButtonPressed() {
        dismiss(animated: true)
    }
    
    func setValueForSliders () {
        let colourOfMainView = CIColor(color: mainScreenColour)
        
        redSlider.value = Float(colourOfMainView.red)
        greenSlider.value = Float(colourOfMainView.green)
        blueSlider.value = Float(colourOfMainView.blue)
    }
    
    func setValuesForLabels () {
        redLabel.text = String(redSlider.value)
        greenLabel.text = String(greenSlider.value)
        blueLabel.text = String(blueSlider.value)
    }
    
    func setValuesForTextFields () {
        redTextField.text = redLabel.text
        greenTextField.text = greenLabel.text
        blueTextField.text = blueLabel.text
    }
    
    
    func settingsViewResult() {
        let colourView = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        settingsView.backgroundColor = colourView
    }
    
    func showAlert () {
        let alert = UIAlertController(title: "Error", message: "Wrong input", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true)
        
    }

}

extension SettingsViewController: UITextViewDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
