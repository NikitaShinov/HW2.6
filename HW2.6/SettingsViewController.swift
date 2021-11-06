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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsView.layer.cornerRadius = 15
        
        redSlider.value = 0.5
        greenSlider.value = 0.5
        blueSlider.value = 0.5
        
        
//        redTextField.addTarget(self, action: #selector(chgTextFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        
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
    
    
    @IBAction func doneButtonPressed() {
        dismiss(animated: true)
    }
    
    func settingsViewResult() {
        let colourView = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        settingsView.backgroundColor = colourView
    }
    
    
//    func setValueForSlider (textField: UITextField, slider: UISlider) {
//        guard let text = textField.text else { return }
//        if let textValue = Float(text) {
//            slider.value = textValue
//        }
//        settingsViewResult()
//    }
//    @objc func chgTextFieldDidChange(textField: UITextField) {
//        if let chgStringValue = textField.text {
//            if let chgIntValue = Int(chgStringValue) {
//                redSlider.setValue(Float(Double(chgIntValue)), animated: true)
//            }
//        }
//    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func setValueForSlider (textField: UITextField, slider: UISlider) {
        guard let text = textField.text else { return }
        if let textValue = Float(text) {
            slider.value = textValue
        }
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

