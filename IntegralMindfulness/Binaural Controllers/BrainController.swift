//
//  BrainController.swift
//  IntegralMindfulness
//
//  Created by Bartek on 5/23/20.
//  Copyright © 2020 Bartek. All rights reserved.
//

import Foundation
import UIKit

class BrainController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let binouralTitle = ["Anxiety Relief", "Creativity","Overcome Addiction", "Relaxed/Awake", "Focus", "Intelligence"]
     let binouralImage = [
               UIImage(named: "study"),
               UIImage(named: "spirit"),
               UIImage(named: "sleep"),
               UIImage(named: "body"),
               UIImage(named: "brain"),
               UIImage(named: "study")
           ]
           
           let binauralDyscription = ["2.5Hz 315-317", "7.5Hz 253-260.5", "8.22Hz 350-358.22", "11Hz 400-411", "40Hz 130-170", "15.4Hz 275-290.4"]
           
           override func viewDidLoad() {
               super.viewDidLoad()
               
               collectionView.delegate = self
               collectionView.dataSource = self
               
           }


       }

       extension BrainController: UICollectionViewDataSource, UICollectionViewDelegate {
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
