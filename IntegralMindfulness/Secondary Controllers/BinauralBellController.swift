//
//  BinauralBellController.swift
//  IntegralMindfulness
//
//  Created by Bartek on 5/19/20.
//  Copyright © 2020 Bartek. All rights reserved.
//

import Foundation

import UIKit

class BinauralBellController: UIViewController {
//This class will have to act as a fill in and take the data from Binaural Controllers and then fill it in to HomeViewController
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let binouralTitle = ["SPIRIT", "SLEEP","BODY", "BRAIN", "STUDY"]

    let binouralImage = [
        UIImage(named: "study"),
        UIImage(named: "spirit"),
        UIImage(named: "sleep"),
        UIImage(named: "body"),
        UIImage(named: "brain"),
    ]
    
    let binauralDyscription = ["Unity | Inner awareness | Shamanic Conciousness | Astral travel | Solfeggio? | Trance | Third eye", "Sleep | Lucid dreaming | Wellbeing | Relaxation(Less sleep required) | Restful Sleep | Relief", "Universal healing | Euphoria | Reduced stress | Emotional healing | Relaxation | Migrane Pain?| Fatigue", "Intelligence | Focus | Relaxed yet awake | Creativity | Overcome addiction | Releaves anxiety", "Memory | Concentration | Focus | Study aid"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }


}

extension BinauralBellController: UICollectionViewDataSource, UICollectionViewDelegate {
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
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            
            let studyVC = storyboard?.instantiateViewController(withIdentifier: "StudyController") as! StudyController
            let spiritVC = storyboard?.instantiateViewController(withIdentifier: "SpiritController") as! SpiritController
            let sleepVC = storyboard?.instantiateViewController(withIdentifier: "SleepController") as! SleepController
            let bodyVC = storyboard?.instantiateViewController(withIdentifier: "BodyController") as! BodyController
            let brainVC = storyboard?.instantiateViewController(withIdentifier: "BrainController") as! BrainController

            switch indexPath.row {
            case 0:
                self.navigationController?.pushViewController(spiritVC, animated: true)
               
            case 1:
                self.navigationController?.pushViewController(sleepVC, animated: true)
            case 2:
                self.navigationController?.pushViewController(bodyVC, animated: true)
            case 3:
                self.navigationController?.pushViewController(brainVC, animated: true)
            case 4:
                self.navigationController?.pushViewController(studyVC, animated: true)

            default:
                print("Error in the downfallofusall")
            }
            
//            if indexPath.row == 0 {
//                self.show(spiritVC, sender: self)
//            } else if indexPath.row == 1 {
//                self.show(sleepVC, sender: self)
//            } else if indexPath.row == 2 {
//                self.show(bodyVC, sender: self)
//            } else if indexPath.row == 3 {
//                self.show(brainVC, sender: self)
//            }else if indexPath.row == 4 {
//                self.show(studyVC, sender: self)
//            } else {
//                print("Fail")
//            }
    //
        }


    }

    

