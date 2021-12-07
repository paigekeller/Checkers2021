//
//  GameScreen.swift
//  Checkers
//
//  Created by Paige Keller on 12/2/21.
//

import UIKit

class GameScreen: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var playerType = AppData.playerType
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    var player1Name: String!
    var player2Name: String!
    var moving: Bool = false
    var originalSpot = 0
    var movingToSpot = 0
    
    @IBOutlet weak var playerTwoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let game = Game()
        
        collectionView.delegate = self
        collectionView.dataSource = self
                
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
        
        playerTwoLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        
        print(playerType)
        
        // Do any additional setup after loading the view.
        
    }
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        
        if moving == true {
            movingToSpot = indexPath.row
            move(movingTo: movingToSpot, movingFrom: originalSpot)
            
        } else if moving == false {
            moving = true
            originalSpot = indexPath.row
        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 64
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CustomCollectionCell
        
        
        
        
        if (indexPath.row < 8) {
        if indexPath.row % 2 == 0 {
        cell.backgroundColor = UIColor.black
            cell.configure(color: UIColor.black)
        } else {
            cell.backgroundColor = UIColor.red
        }
        } else if (indexPath.row < 16) {
            if indexPath.row % 2 != 0 {
            cell.backgroundColor = UIColor.black
                cell.configure(color: UIColor.black)
            } else {
                cell.backgroundColor = UIColor.red
            }
        } else if (indexPath.row < 24) {
            if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.black
                cell.configure(color: UIColor.black)
            } else {
                cell.backgroundColor = UIColor.red
            }
        } else if (indexPath.row < 32) {
            if indexPath.row % 2 != 0 {
            cell.backgroundColor = UIColor.black
            } else {
                cell.backgroundColor = UIColor.red
            }
        } else if (indexPath.row < 40) {
            if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.black
            } else {
                cell.backgroundColor = UIColor.red
            }
        }else if (indexPath.row < 48) {
            if indexPath.row % 2 != 0 {
            cell.backgroundColor = UIColor.black
                cell.configure(color: UIColor.red)
            } else {
                cell.backgroundColor = UIColor.red
            }
        } else if (indexPath.row < 56) {
            if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.black
                cell.configure(color: UIColor.red)
            } else {
                cell.backgroundColor = UIColor.red
            }
        } else if (indexPath.row < 64) {
            if indexPath.row % 2 != 0 {
            cell.backgroundColor = UIColor.black
                cell.configure(color: UIColor.red)
            } else {
                cell.backgroundColor = UIColor.red
            }
        }
        return cell
    }
    
    func move(movingTo: Int, movingFrom: Int) {
        
        //if not on a corner or edge
        if (movingFrom > 8 && movingFrom < 15) || (movingFrom > 16 && movingFrom < 23) || (movingFrom > 24 && movingFrom < 31) || (movingFrom > 32 && movingFrom < 39) || (movingFrom > 40 && movingFrom < 47) || (movingFrom > 48 && movingFrom < 55) {
            
            if movingTo == movingFrom + 9 || movingTo == movingFrom + 7 || movingTo == movingFrom - 9 || movingTo == movingFrom - 7 { //propper move?
                
                print("moved!")
                
            }
            
        }
        
    }
    
    
}
