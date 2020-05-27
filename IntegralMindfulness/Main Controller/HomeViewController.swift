//
//  CreateBellViewController.swift
//  IntegralMindfulness
//
//  Created by Bartek on 5/19/20.
//  Copyright © 2020 Bartek. All rights reserved.
//


import UIKit
import AVFoundation
import DropDown


class HomeViewController: UIViewController {
    
    var hours: Int = 0
    var minutes: Int = 0
    var seconds: Int = 0
    
    let hrs = 3600
    let min = 3600 / 60
    let sec = 60
    
    let activityDropDown = DropDown()
    let warmUpDropDown = DropDown()

    @IBOutlet weak var infinity: UIImageView!
    @IBOutlet weak var activityTypeLabel: UIButton!
    @IBOutlet weak var warmUpLabel: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var binauralBeatsAssistingLabel: UILabel!
    @IBOutlet weak var startingBellAssistingLabel: UILabel!
    @IBOutlet weak var ambientSoundAssistingLabel: UILabel!
    @IBOutlet weak var endingBellAssistingLabel: UILabel!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        activityDropDown.anchorView = activityTypeLabel
        activityDropDown.bottomOffset = CGPoint(x: 0, y:(activityDropDown.anchorView?.plainView.bounds.height)!)
    
        activityDropDown.dataSource = ["Meditation", "Yoga", "Tai Chi", "Walking", "Breating", "Chanting", "Prayer", "Healing"]
       
        activityDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            self.activityTypeLabel.setTitle(self.activityDropDown.selectedItem, for: .normal)
        }
        
        warmUpDropDown.anchorView = warmUpLabel
        warmUpDropDown.bottomOffset = CGPoint(x: 0, y:(activityDropDown.anchorView?.plainView.bounds.height)!)
        warmUpDropDown.dataSource = ["0s", "5s", "10s", "15s", "20s", "30s", "1m", "2m", "5m", "10m", "1h"]
        
        warmUpDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
        print("Selected item: \(item) at index: \(index)")
          self.warmUpLabel.setTitle(self.warmUpDropDown.selectedItem, for: .normal)
        }
        
        
        pickerView.delegate = self
        pickerView.dataSource = self
    
    }
   
   
    
    @IBAction func binauralBeatsButton(_ sender: UIButton) {
        let binauralVC = storyboard?.instantiateViewController(withIdentifier: "BinauralBellController") as! BinauralBellController
        
        let spiritCNTRL = storyboard?.instantiateViewController(withIdentifier: "SpiritController") as! SpiritController
        
       
        self.navigationController?.pushViewController(binauralVC, animated: true)
         spiritCNTRL.spiritControllerDelegate = self
        
    }
    
    @IBAction func ambientSoundButton(_ sender: UIButton) {
        let ambientVC = storyboard?.instantiateViewController(withIdentifier: "AmbientBellController") as! AmbientBellController
        
        ambientVC.ambientSoundDelegate = self
    
    }
    @IBAction func startingButton(_ sender: UIButton) {
        let startingVC = storyboard?.instantiateViewController(withIdentifier: "StartingBellController") as! StartingBellController
        startingVC.startingBellDelegate = self
        
    }
    
    @IBAction func endingButton(_ sender: UIButton) {
        let endingVC = storyboard?.instantiateViewController(withIdentifier: "EndingBellController") as! EndingBellController
        endingVC.startingBellDelegate = self
        
    }
    @IBAction func intervalButton(_ sender: UIButton) {
        let intervalVC = storyboard?.instantiateViewController(withIdentifier: "IntervalBellController") as! IntervalBellController
        self.navigationController?.pushViewController(intervalVC, animated: true)
        
        
    }
    
    @IBAction func infinityButton(_ sender: UIButton) {
         //  let circle = UIImage(systemName: "circle")
           if pickerView.isHidden == false {
               pickerView.isHidden = true
               infinity.alpha = 1
               
               
           } else {
               pickerView.isHidden = false
               infinity.alpha = 0
           }
           
       }
    
    @IBAction func activityTypeButton(_ sender: UIButton) {
        
        activityDropDown.show()
      
       
    }
    @IBAction func warmUp(_ sender: UIButton) {
           warmUpDropDown.show()
        
    }
}
extension HomeViewController: getAmbientSoundProtocol {
    func didGetAmbientSound(soundName: String) {
        
        
        ambientSoundAssistingLabel.text = soundName
    }
}
extension HomeViewController: getSpiritControllerProtocol {
    func didGetBeat(beatName: String) {
        binauralBeatsAssistingLabel.text = beatName
    }
}
extension HomeViewController: getStartingBellProtocol {
    func didSelectABell(nameOfBell: String) {
        startingBellAssistingLabel.text = nameOfBell
    }
}

extension HomeViewController: getEndingBellProtocol {
    func didSelectBell(bellName: String) {
        endingBellAssistingLabel.text = bellName
    }
}


extension HomeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    //Rows & Numbers
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 25
        case 1,2:
            return 60
        default:
            return 0
        }
    }

   

    //Width
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.size.width/5
    }
    //Title
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(row) h"
        case 1:
            return "\(row) m"
        case 2:
            return "\(row) s"
        default:
            return ""
        }
    }
    //Selected row
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            hours = row
        case 1:
            minutes = row
        case 2:
            seconds = row
        default:
            break;
            
            
        }
        
    }
//    //MARK: - Changes PickerView Color
//    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
//
//        let string = "\(row) h"
//
//        return NSAttributedString(string: string, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
//       }
}


var player: AVAudioPlayer!

func playSound(soundName: String) {
    let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
    player = try! AVAudioPlayer(contentsOf: url!)
    player.play()
}
