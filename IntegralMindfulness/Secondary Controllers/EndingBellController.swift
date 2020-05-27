//
//  EndingBellController.swift
//  IntegralMindfulness
//
//  Created by Bartek on 5/27/20.
//  Copyright © 2020 Bartek. All rights reserved.
//

import Foundation
import UIKit
import MSPeekCollectionViewDelegateImplementation

protocol getEndingBellProtocol {
    func didSelectBell(bellName: String)
}

class EndingBellController: UIViewController {
    
    var startingBellDelegate: getEndingBellProtocol?
    
    
    @IBOutlet weak var repeatEndingButtonOne: UIButton!
    @IBOutlet weak var repeatEndingButtonTwo: UIButton!
    @IBOutlet weak var repeatEndingButtonThree: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var imageArray: [UIImage] = [
        UIImage(named: "tibetanBell")!,
        UIImage(named: "singingBowl")!,
        UIImage(named: "gong2")!,
        UIImage(named: "gong")!,
        UIImage(named: "bowls")!,
    ]
    var imageArrayBellNames: [String] = [
        "tibetanBell",
        "singingbowl",
        "gong2",
        "gong",
        "bowls",
    ]
    var behavior = MSCollectionViewPeekingBehavior()
    
    var chosenSound = ""
    var chosenSoundLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        //If this is changed then you have to change the center point of the app "Current Index"
        behavior = MSCollectionViewPeekingBehavior(cellPeekWidth: 30)
        behavior = MSCollectionViewPeekingBehavior(cellSpacing: 50)
        
        collectionView.configureForPeekingBehavior(behavior: behavior)
        
    }
    
    
    @IBAction func repeatEndingSound(_ sender: UIButton) {
        let circle = UIImage(systemName: "circle")
        
        updateEndingRepeatButtons()
        sender.isSelected = true
        sender.alpha = 1.0
        sender.setBackgroundImage(circle, for: UIControl.State.normal)
    }
    func updateEndingRepeatButtons() {
        repeatEndingButtonOne.isSelected = false
          repeatEndingButtonOne.alpha = 0.3
          repeatEndingButtonOne.setBackgroundImage(nil, for: UIControl.State.normal)
         
          repeatEndingButtonTwo.isSelected = false
          repeatEndingButtonTwo.alpha = 0.3
          repeatEndingButtonTwo.setBackgroundImage(nil, for: UIControl.State.normal)
        
          repeatEndingButtonThree.isSelected = false
          repeatEndingButtonThree.alpha = 0.3
          repeatEndingButtonThree.setBackgroundImage(nil, for: UIControl.State.normal)
    }
    
    @IBAction func saveNavButton(_ sender: UIBarButtonItem) {
        
        startingBellDelegate?.didSelectBell(bellName: chosenSoundLabel)
        
        player.pause()
    }
    
}


extension EndingBellController: UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == self.collectionView {
            return 1
        } else {
            return 1
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
            return imageArray.count
      
    }
    //Assigns Images and Lable names to the bells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! StartingEndingViewCell
            
            let images = imageArray[indexPath.row]
            cell.imageView.image = images
            
            let imageNames = imageArrayBellNames[indexPath.row]
            cell.imageLabel.text = imageNames
            
            return cell
        
    }
    //MARK: - Select Sound Here
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    
            
            let currentIndex = self.collectionView.contentOffset.x / self.collectionView.frame.size.width
            let indexPathNoDecimal = String(format: "%.0f", currentIndex * 1.4)
          
            print(indexPathNoDecimal)
            
            //Picks the Sound for the delegate to move it to MainScreenController
            switch indexPathNoDecimal {
            case "0":
                chosenSoundLabel = "tibetanBell"
                chosenSound = "1"
                 playSound(soundName: chosenSound)
            case "1":
                chosenSoundLabel = "singingBowl"
                chosenSound = "2"
                 playSound(soundName: chosenSound)
            case "2":
                chosenSoundLabel = "Gong"
                chosenSound = "3"
                 playSound(soundName: chosenSound)
            case "3":
                chosenSoundLabel = "gong2"
                chosenSound = "4"
                 playSound(soundName: chosenSound)
            case "4":
                chosenSoundLabel = "bowls"
                chosenSound = "5"
                 playSound(soundName: chosenSound)
            default:
                playSound(soundName: "Bell22")
            
            
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        print(chosenSound)
        
        switch String(indexPath.row) {
               case "0":
                  chosenSoundLabel = "tibetanBell"
                   chosenSound = "1"
            playSound(soundName: chosenSound)
               case "1":
                   chosenSoundLabel = "Gong"
                   chosenSound = "2"
            playSound(soundName: chosenSound)
               case "2":
                   chosenSoundLabel = "Gong2"
                   chosenSound = "3"
            playSound(soundName: chosenSound)
               case "3":
                   chosenSoundLabel = "singingBowl"
                   chosenSound = "4"
            playSound(soundName: chosenSound)
               case "4":
                   chosenSoundLabel = "bowls"
                   chosenSound = "5"
            playSound(soundName: chosenSound)
               default:
                   playSound(soundName: "Bell22")
               }
            
            
     
        
       }
}


extension EndingBellController: UICollectionViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        behavior.scrollViewWillEndDragging(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
       
    }
}
