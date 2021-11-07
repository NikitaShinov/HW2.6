//
//  ViewController.swift
//  HW2.6
//
//  Created by Никита Шинов on 05.11.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func updateColour (colour: UIColor)
}

class ViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if let settingsVC = segue.destination as? SettingsViewController {
                    settingsVC.mainScreenColour = mainView.backgroundColor
                    settingsVC.delegate = self
            }
        }
    }
extension ViewController: SettingsViewControllerDelegate {
    func updateColour (colour: UIColor) {
        mainView.backgroundColor = colour
    }
}
