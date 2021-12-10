//
//  CustomCollectionCell.swift
//  Checkers
//
//  Created by Paige Keller on 12/5/21.
//

import UIKit

class CustomCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    var chipColor = ""
    
    
    func configure(color: UIColor) {
        if color == UIColor.red {
            image.image = UIImage(named: "redCheck")
        } else {
            image.image = UIImage(named: "blackCheck")
        }
    }
    
    
    func setImage(name: String) {
        if name == "" {
            image.image = nil
            chipColor = ""
        } else {
        image.image = UIImage(named: name)
            if name == "redCheck" {
                chipColor = "red"
            } else {
                chipColor = "black"
            }
        }
    }
    
    func checkCheck() -> Bool {
        if image.image == nil {
            return false
        }
        
        return true
    }
    
}
