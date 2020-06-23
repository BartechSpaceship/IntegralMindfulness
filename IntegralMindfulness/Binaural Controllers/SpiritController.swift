//
//  SpiritController.swift
//  IntegralMindfulness
//
//  Created by Bartek on 5/23/20.
//  Copyright © 2020 Bartek. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

protocol getSpiritControllerProtocol {
    func didGetBeat(beatName: String)
}

class SpiritController: UIViewController {
    
    var spiritControllerDelegate: getSpiritControllerProtocol?
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var saveBarOutlet: UIBarButtonItem!
    var player2: AVAudioPlayer!
    var currentSound = ""
    
    
    
    let binouralTitle = ["Unity", "Inner Awareness","Shamanic Conciousness", "Astral Travel", "Solffegio!", "Trance", "Third Eye"]
    
    let binouralImage = [
        UIImage(named: "study"),
        UIImage(named: "spirit"),
        UIImage(named: "sleep"),
        UIImage(named: "body"),
        UIImage(named: "brain"),
        UIImage(named: "study"),
        UIImage(named: "spirit")
    ]
    
    let binauralDyscription = ["3.5Hz 123.5-127", "3.9Hz 111-114.9", "4.5Hz 200-204.5", "6.3Hz 242-246.3", "7.83Hz 430-437.83", "5.5Hz 131-136.5", "13Hz 185-198"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // navigationItem.rightBarButtonItem = nil
        buttonIsHidden()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
    }
    func buttonIsHidden() {
        
        self.navigationItem.rightBarButtonItem = self.saveBarOutlet
        
        
        
        
    }
    
    @IBAction func saveNavButton(_ sender: UIBarButtonItem) {
        
       
        self.navigationController?.popToRootViewController(animated: true)
        
        spiritControllerDelegate?.didGetBeat(beatName: currentSound)
        
        player.pause()
        
        
    }
    
}

extension SpiritController: UICollectionViewDataSource, UICollectionViewDelegate {
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
        
        
        switch indexPath.row {
        case 0:
            currentSound = "Unity"
            playSound2(soundName: "3.5hz123.5-127")
            print(currentSound)
        case 1:
            currentSound = "Inner Awarenesd"
            playSound2(soundName: "3.9hz111-114.9")
            print(currentSound)
        case 2:
            currentSound = "Shamanic Conciousness"
            playSound2(soundName: "4.5hz200-204.5")
            print(currentSound)
        case 3:
            currentSound = "Astral Travel"
        case 4:
            currentSound = "Unity"
        case 5:
            currentSound = "Unity"
        case 6:
            currentSound = "Unity"
        default:
            print("YOU DONE MASSADUPMAN")
        }
        //
    }
    
    
    
    func playSound2(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    
    
    
}


        
