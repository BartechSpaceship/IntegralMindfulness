//
//  BodyController.swift
//  IntegralMindfulness
//
//  Created by Bartek on 5/23/20.
//  Copyright © 2020 Bartek. All rights reserved.
//

import Foundation
import UIKit

class BodyController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
     let binouralTitle = ["Relaxation", "Universal Healing","Bliss", "Migraine Pain", "Reduced Stress", "Emotional Healing", "Fatigue"]

           let binouralImage = [
               UIImage(named: "study"),
               UIImage(named: "spirit"),
               UIImage(named: "sleep"),
               UIImage(named: "body"),
               UIImage(named: "brain"),
               UIImage(named: "study"),
               UIImage(named: "spirit")
           ]
           
           let binauralDyscription = ["0.5Hz 60-60.5", "1.5Hz 68-69.5", "0.9 Hz 80-80.9", "2.5Hz 79.5-82", "4.0Hz 418-422", "7Hz 284-291", "20Hz 220-240"]
           
           override func viewDidLoad() {
               super.viewDidLoad()
               
               collectionView.delegate = self
               collectionView.dataSource = self
               
           }


       }

       extension BodyController: UICollectionViewDataSource, UICollectionViewDelegate {
             func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                   return binouralTitle.count
               }
               
               func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                   let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
                   
                   cell.binauralTitle.text = binouralTitle[indexPath.row]
                   cell.binauralImage.image = binouralImage[indexPath.row]
                   cell.binauralDiscription.text = binauralDyscription[indexPath.row]
                   
                   cell.contentView.layer.cornerRadius = 4.0
                   cell.contentView.layer.borderWidth = 1.0
                   cell.contentView.layer.borderColor = UIColor.clear.cgColor
                   cell.contentView.layer.masksToBounds = false
                   cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
                   cell.layer.shadowColor = UIColor.gray.cgColor
                   cell.layer.shadowRadius = 4.0
                   cell.layer.shadowOpacity = 1.0
                   cell.layer.masksToBounds = false
                   cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
                   
                   return cell
                   
               }
       //        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       //            print(indexPath.row)
       //            let studyVC = storyboard?.instantiateViewController(withIdentifier: "StudyController") as! StudyController
       //            let spiritVC = storyboard?.instantiateViewController(withIdentifier: "SpiritController") as! SpiritController
       //            let sleepVC = storyboard?.instantiateViewController(withIdentifier: "SleepController") as! SleepController
       //            let bodyVC = storyboard?.instantiateViewController(withIdentifier: "BodyController") as! BodyController
       //            let brainVC = storyboard?.instantiateViewController(withIdentifier: "BrainController") as! BrainController
       //
       //            if indexPath.row == 0 {
       //                self.show(studyVC, sender: self)
       //            } else if indexPath.row == 1 {
       //                self.show(spiritVC, sender: self)
       //            } else if indexPath.row == 2 {
       //                self.show(sleepVC, sender: self)
       //            } else if indexPath.row == 3 {
       //                self.show(bodyVC, sender: self)
       //            }else if indexPath.row == 4 {
       //                self.show(brainVC, sender: self)
       //            } else {
       //                print("Fail")
       //            }
       //    //
       //        }


           }

           
       //}
