//
//  ViewController.swift
//  IntegralMindfulness
//
//  Created by Bartek on 5/19/20.
//  Copyright © 2020 Bartek. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func createBellButton(_ sender: UIButton) {
         let HomeVC = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
       
        
        self.performSegue(withIdentifier: "goToNav", sender: self)
     
      //  self.present(HomeVC, animated: true, completion: nil)
    }
    

    
    
}

