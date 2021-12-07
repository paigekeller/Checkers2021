//
//  CustomCollectionCell.swift
//  Checkers
//
//  Created by Paige Keller on 12/5/21.
//

import UIKit

class CustomCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    
    func configure(color: UIColor) {
        if color == UIColor.red {
            image.image = UIImage(named: "redCheck")
        } else {
            image.image = UIImage(named: "blackCheck")
        }
    }
    
    
}
