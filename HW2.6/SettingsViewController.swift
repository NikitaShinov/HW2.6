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
        
        redSlider.thumbTintColor = .red
        greenSlider.thumbTintColor = .green
        blueSlider.thumbTintColor = .blue
        
        setNewValues()
        
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
        updateColour()
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
        updateColour()
    }
    
    @IBAction func doneButtonPressed() {
        delegate?.updateColour(colour: settingsView.backgroundColor!)
        dismiss(animated: true)
    }
    
    func setNewValues () {
        let colourOfMainView = CIColor(color: mainScreenColour)
        
        redSlider.value = Float(colourOfMainView.red)
        greenSlider.value = Float(colourOfMainView.green)
        blueSlider.value = Float(colourOfMainView.blue)
        
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f",blueSlider.value)
        
        redTextField.text = String(format: "%.2f", redSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        blueTextField.text = String(format: "%.2f", blueSlider.value)
    }
    
    func updateColour() {
        let colourView = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        settingsView.backgroundColor = colourView
        delegate?.updateColour(colour: colourView)
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
