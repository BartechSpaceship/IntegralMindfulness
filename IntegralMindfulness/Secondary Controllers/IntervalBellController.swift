//
//  IntervalBellController.swift
//  IntegralMindfulness
//
//  Created by Bartek on 5/19/20.
//  Copyright © 2020 Bartek. All rights reserved.
//

import Foundation
import UIKit

class IntervalBellController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func addNewObject(_ sender: UIBarButtonItem) {
        
        let createIBC = storyboard?.instantiateViewController(withIdentifier: "newIntervalBell") as! IntervalBellCreationController
        
        
        createIBC.modalPresentationStyle = .fullScreen
        self.present(createIBC, animated: true, completion: nil)
    
        
    }
    
    @IBAction func editExistingObject(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func saveCurrentObjects(_ sender: UIBarButtonItem) {
        
    }
    
    
    
}
