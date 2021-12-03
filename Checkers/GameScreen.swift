//
//  GameScreen.swift
//  Checkers
//
//  Created by Paige Keller on 12/2/21.
//

import UIKit

class GameScreen: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
        
        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 64
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath)
        
        
        if (indexPath.row < 8) {
        if indexPath.row % 2 == 0 {
        cell.backgroundColor = UIColor.darkGray
        } else {
            cell.backgroundColor = UIColor.red
        }
        } else if (indexPath.row < 16) {
            if indexPath.row % 2 != 0 {
            cell.backgroundColor = UIColor.darkGray
            } else {
                cell.backgroundColor = UIColor.red
            }
        } else if (indexPath.row < 24) {
            if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.darkGray
            } else {
                cell.backgroundColor = UIColor.red
            }
        } else if (indexPath.row < 32) {
            if indexPath.row % 2 != 0 {
            cell.backgroundColor = UIColor.darkGray
            } else {
                cell.backgroundColor = UIColor.red
            }
        } else if (indexPath.row < 40) {
            if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.darkGray
            } else {
                cell.backgroundColor = UIColor.red
            }
        }else if (indexPath.row < 48) {
            if indexPath.row % 2 != 0 {
            cell.backgroundColor = UIColor.darkGray
            } else {
                cell.backgroundColor = UIColor.red
            }
        } else if (indexPath.row < 56) {
            if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.darkGray
            } else {
                cell.backgroundColor = UIColor.red
            }
        } else if (indexPath.row < 64) {
            if indexPath.row % 2 != 0 {
            cell.backgroundColor = UIColor.darkGray
            } else {
                cell.backgroundColor = UIColor.red
            }
        }
        return cell
    }
    
}