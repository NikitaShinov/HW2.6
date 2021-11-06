//
//  ViewController.swift
//  HW2.6
//
//  Created by Никита Шинов on 05.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func settingsPressed() {
        performSegue(withIdentifier: "settingsSegue", sender: nil)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let settingsVC = segue.destination as? SettingsViewController else { return }
}
    

