//
//  AmbientBellController.swift
//  IntegralMindfulness
//
//  Created by Bartek on 5/19/20.
//  Copyright © 2020 Bartek. All rights reserved.
//

import Foundation

import UIKit

protocol getAmbientSoundProtocol {
    func didGetAmbientSound(soundName: String)
}

class AmbientBellController: UIViewController {
    
    var ambientSoundDelegate: getAmbientSoundProtocol?
   
    @IBOutlet weak var ambientLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var chosenAmbientImage = ""
    var textName = ""
    
  let binouralImage = [
       UIImage(named: "study"),
       UIImage(named: "spirit"),
       UIImage(named: "sleep"),
       UIImage(named: "body"),
       UIImage(named: "brain"),
       UIImage(named: "study"),
       UIImage(named: "spirit"),
       UIImage(named: "sleep"),
       UIImage(named: "body"),
       UIImage(named: "brain"),
       UIImage(named: "study"),
       UIImage(named: "spirit"),
       UIImage(named: "sleep"),
       UIImage(named: "body"),
       UIImage(named: "brain"),
       UIImage(named: "study"),
       UIImage(named: "spirit"),
       UIImage(named: "sleep"),
       UIImage(named: "body"),
       UIImage(named: "brain"),
       UIImage(named: "body"),
       UIImage(named: "brain"),
   ]
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            collectionView.register(AmbientCollectionViewCell.nib(), forCellWithReuseIdentifier: AmbientCollectionViewCell.identifier)
            collectionView.delegate = self
            collectionView.dataSource = self
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 130, height: 120)
            collectionView.collectionViewLayout = layout
            
            
        }
    
    @IBAction func saveBarButton(_ sender: UIBarButtonItem) {
        
            ambientSoundDelegate?.didGetAmbientSound(soundName: chosenAmbientImage)
        
        
        navigationController?.popViewController(animated: true)
        player.pause()
    }
    
}
       
extension AmbientBellController: UICollectionViewDelegate {//Delegate helps to pick up interaction with the cells
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print(indexPath.item)
            
            
          
            
          
            switch String(indexPath.item) {
            case "0":
                
            
            textName = "Vitamin C"
            chosenAmbientImage = "bellAir"
            playSound(soundName: chosenAmbientImage)
            ambientLabel.text = chosenAmbientImage
            case "1":
            print(textName)
            textName = "Supra dupra"
            chosenAmbientImage = "brainMusic"
            playSound(soundName: chosenAmbientImage)
            ambientLabel.text = chosenAmbientImage
            case "2":
            chosenAmbientImage = "brainMusic2"
            playSound(soundName: chosenAmbientImage)
            case "3":
            chosenAmbientImage = "catPurr"
            playSound(soundName: chosenAmbientImage)
            case "4":
            chosenAmbientImage = "crickets"
            playSound(soundName: chosenAmbientImage)
            case "5":
            chosenAmbientImage = "drumsNoShaman"
            playSound(soundName: chosenAmbientImage)
            case "6":
            chosenAmbientImage = "drumsWithAShaman"
            playSound(soundName: chosenAmbientImage)
            case "7":
            chosenAmbientImage = "farts"
            playSound(soundName: chosenAmbientImage)
            case "8":
            chosenAmbientImage = "fire"
            playSound(soundName: chosenAmbientImage)
            case "9":
            chosenAmbientImage = "fly"
            playSound(soundName: chosenAmbientImage)
            case "10":
            chosenAmbientImage = "forestExperience"
            playSound(soundName: chosenAmbientImage)
            case "11":
            chosenAmbientImage = "frogs"
            playSound(soundName: chosenAmbientImage)
            case "12":
            chosenAmbientImage = "lightMusic"
            playSound(soundName: chosenAmbientImage)
            case "13":
            chosenAmbientImage = "meditativeRinging"
            playSound(soundName: chosenAmbientImage)
            case "14":
            chosenAmbientImage = "ohm"
            playSound(soundName: chosenAmbientImage)
            case "15":
            chosenAmbientImage = "oneDrum"
            playSound(soundName: chosenAmbientImage)
            case "16":
            chosenAmbientImage = "rainyBird"
            playSound(soundName: chosenAmbientImage)
            case "17":
            chosenAmbientImage = "shaman"
            playSound(soundName: chosenAmbientImage)
            case "18":
            chosenAmbientImage = "stressBalls"
            playSound(soundName: chosenAmbientImage)
            case "19":
            chosenAmbientImage = "thunder"
            playSound(soundName: chosenAmbientImage)
            case "20":
            chosenAmbientImage = "waterfall"
            playSound(soundName: chosenAmbientImage)
            case "21":
            chosenAmbientImage = "windy"
            playSound(soundName: chosenAmbientImage)
            default:
                print("Failure")
            }
            player.numberOfLoops = -1
              
    }
}

extension AmbientBellController: UICollectionViewDataSource {//tells howmany cells in a given section
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //        imageArray.count
            return binouralImage.count
            
        }
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AmbientCollectionViewCell.identifier, for: indexPath) as!  AmbientCollectionViewCell
         
            cell.imageView.image = binouralImage[indexPath.item]
   
            return cell
        }
    }

//
//extension AmbientBellController: UICollectionViewDelegateFlowLayout {
//        //margin and padding between each cell
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            return CGSize(width: 130, height: 130)
//        }
//
//    }
//

