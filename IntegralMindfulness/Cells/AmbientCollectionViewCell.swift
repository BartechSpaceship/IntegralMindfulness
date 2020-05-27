//
//  AmbientCollectionViewCell.swift
//  IntegralMindfulness
//
//  Created by Bartek on 5/20/20.
//  Copyright © 2020 Bartek. All rights reserved.
//

import UIKit

class AmbientCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    static let identifier = "AmbientCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        // Initialization code
    }
    public func configure(with image: UIImage) {
           imageView.image = image
       }
       
       static func nib() -> UINib {
           
           return UINib(nibName: "AmbientCollectionViewCell", bundle: nil)
    }

}
