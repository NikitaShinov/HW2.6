//
//  ViewController.swift
//  HW2.6
//
//  Created by Никита Шинов on 05.11.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func colourSetup (colour: UIColor)
}


class ViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if segue.identifier == "settingsSegue" {
                if let settingsVC = segue.destination as? SettingsViewController {
                    settingsVC.mainScreenColour = mainView.backgroundColor
                    settingsVC.delegate = self
            }
        }
    
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "settingsSegue" {
//            if let settingsVC = segue.destination as? SettingsViewController {
//                settingsVC.mainScreenColour = mainView.backgroundColor
//                settingsVC.delegate = self
//        }
//    }
//    }
    
//    @IBAction func unwind(for segue: UIStoryboardSegue) {
//        let settingsVC = segue.source as! SettingsViewController {
//            settingsVC.delegate = self
//            settingsVC.colourSetup()
//        }
//    }
    
// MARK: - SettingsViewControllerDelegate
extension ViewController: SettingsViewControllerDelegate {
    func colourSetup (colour: UIColor) {
        mainView.backgroundColor = colour
    }
}
