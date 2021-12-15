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
    var cellArray: [CustomCollectionCell] = []
    var player1Name: String!
    var player2Name: String!
    var moving: Bool = false
    var originalSpot = 0
    var movingToSpot = 0
    var currentColorTurn: String = "red" //always start with red
    let game = Game()
    @IBOutlet weak var playerTwoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        collectionView.delegate = self
        collectionView.dataSource = self
                
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "woodTexture")!)
        
        playerTwoLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        
        print(playerType)
        
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func rulePopUpButton(_ sender: UIButton) {
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RulePopUp") as! RulesPopUpViewController
        self.addChild(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParent: self)
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        
        if (cellArray[indexPath.row].checkCheck() == false && moving == false) || (cellArray[indexPath.row].checkCheck() == true && moving == true){
            //nothing
        } else {
        
        print(moving)
        if moving == true {
            movingToSpot = indexPath.row
            moving = false
            print(currentColorTurn)
            if currentColorTurn == "red" {moveRed(movingTo: movingToSpot, movingFrom: originalSpot)} else {moveBlack(movingTo: movingToSpot, movingFrom: originalSpot)}
        } else if moving == false {
            moving = true
            originalSpot = indexPath.row
        }
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 64
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CustomCollectionCell
        
        cell.setImage(name: "")
        
        
        if (indexPath.row < 8) {
        if indexPath.row % 2 == 0 {
        cell.backgroundColor = UIColor.black
            cell.configure(color: UIColor.black)
            game.p2Chips.append(Chip(color: "black", loc: indexPath.row))
        } else {
            cell.backgroundColor = UIColor.red
            
        }
        } else if (indexPath.row < 16) {
            if indexPath.row % 2 != 0 {
            cell.backgroundColor = UIColor.black
                cell.configure(color: UIColor.black)
                game.p2Chips.append(Chip(color: "black", loc: indexPath.row))
            } else {
                cell.backgroundColor = UIColor.red
            }
        } else if (indexPath.row < 24) {
            if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.black
                cell.configure(color: UIColor.black)
                game.p2Chips.append(Chip(color: "black", loc: indexPath.row))
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
                game.p1Chips.append(Chip(color: "red", loc: indexPath.row))
            } else {
                cell.backgroundColor = UIColor.red
            }
        } else if (indexPath.row < 56) {
            if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.black
                cell.configure(color: UIColor.red)
                game.p1Chips.append(Chip(color: "red", loc: indexPath.row))
            } else {
                cell.backgroundColor = UIColor.red
            }
        } else if (indexPath.row < 64) {
            if indexPath.row % 2 != 0 {
            cell.backgroundColor = UIColor.black
                cell.configure(color: UIColor.red)
                game.p1Chips.append(Chip(color: "red", loc: indexPath.row))
            } else {
                cell.backgroundColor = UIColor.red
            }
        }
        
        
        cellArray.append(cell)
        
        return cell
        
    }
    
    
    func moveRed(movingTo: Int, movingFrom: Int) {
        print("HEREEEEE \(cellArray[movingFrom].chipColor)")
        if cellArray[movingFrom].checkCheck() == true && cellArray[movingTo].checkCheck() != true && cellArray[movingFrom].chipColor == "red" {
            
            print("Here")
            
            
        //if not on a corner or edge
        if (movingFrom > 0 && movingFrom < 7) || (movingFrom > 8 && movingFrom < 15) && (movingFrom > 16 && movingFrom < 23) || (movingFrom > 24 && movingFrom < 31) || (movingFrom > 32 && movingFrom < 39) || (movingFrom > 40 && movingFrom < 47) || (movingFrom > 48 && movingFrom < 55) || (movingFrom > 56 && movingFrom < 63) {
                print("inside non Corner")
                print(moving)
            if movingTo == movingFrom - 9 || movingTo == movingFrom - 7 { //propper move

                cellArray[movingTo].setImage(name: "redCheck")
                cellArray[movingFrom].setImage(name: "")
                currentColorTurn = "black"
                for each in game.p1Chips {
                    if each.location == movingFrom {
                        each.location = movingTo
                    }
                }
                
            } else { //skip func :)
                skip(to: movingTo, from: movingFrom)
                for each in game.p1Chips {
                    if each.location == movingFrom {
                        each.location = movingTo
                    }
                }
                currentColorTurn = "black"
            }
            
        } else { //is a corner or edge
            
            print("inside corner or edge")
            if (movingFrom % 8) == 0 { //on left side of board
                if movingTo == movingFrom - 7 { //propper move
                    cellArray[movingTo].setImage(name: "redCheck")
                    cellArray[movingFrom].setImage(name: "")
                    currentColorTurn = "black"
                    for each in game.p1Chips {
                        if each.location == movingFrom {
                            each.location = movingTo
                        }
                    }
                }
                          
            } else if movingFrom % 8 == 7 { //right side of board
                
                        if movingTo == movingFrom - 9 { //propper move
                        
                            cellArray[movingTo].setImage(name: "redCheck")
                            cellArray[movingFrom].setImage(name: "")
                            currentColorTurn = "black"
                            for each in game.p1Chips {
                                if each.location == movingFrom {
                                    each.location = movingTo
                                }
                            }
                        }
                
                }
            
        }
            currentColorTurn = "black"
        }//chechCheck for proper move
    }
    
    
    func moveBlack(movingTo: Int, movingFrom: Int) {
        print("HEREEEEE \(cellArray[movingFrom].chipColor)")
        if cellArray[movingFrom].checkCheck() == true && cellArray[movingTo].checkCheck() != true && cellArray[movingFrom].chipColor == "black" {
            
            print("Here")
            
        
        //if not on a corner or edge
        if (movingFrom > 0 && movingFrom < 7) || (movingFrom > 8 && movingFrom < 15) || (movingFrom > 16 && movingFrom < 23) || (movingFrom > 24 && movingFrom < 31) || (movingFrom > 32 && movingFrom < 39) || (movingFrom > 40 && movingFrom < 47) || (movingFrom > 48 && movingFrom < 55) || (movingFrom > 56 && movingFrom < 63) {
            
                print("inside non Corner")

            if movingTo == movingFrom + 9 || movingTo == movingFrom + 7 { //propper move
                
                cellArray[movingTo].setImage(name: "blackCheck")
                cellArray[movingFrom].setImage(name: "")
                currentColorTurn = "red"
                for each in game.p2Chips {
                    if each.location == movingFrom {
                        each.location = movingTo
                    }
                }
                
            } else { //skip func :)
                skip(to: movingTo, from: movingFrom)
                currentColorTurn = "red"
                for each in game.p2Chips {
                    if each.location == movingFrom {
                        each.location = movingTo
                    }
                }
            }
            
        } else { //is a corner or edge
            
            print("inside corner or edge")
            if (movingFrom % 8) == 0 { //on left side of board
                if movingTo == movingFrom + 9 { //propper move
                    
                    cellArray[movingTo].setImage(name: "blackCheck")
                    cellArray[movingFrom].setImage(name: "")
                    currentColorTurn = "red"
                    for each in game.p2Chips {
                        if each.location == movingFrom {
                            each.location = movingTo
                        }
                    }
                }
                          
            } else if movingFrom % 8 == 7 { //right side of board
                
                        if movingTo == movingFrom + 7 { //propper move
                            
                            cellArray[movingTo].setImage(name: "blackCheck")
                            cellArray[movingFrom].setImage(name: "")
                            currentColorTurn = "red"
                            for each in game.p2Chips {
                                if each.location == movingFrom {
                                    each.location = movingTo
                                }
                            }
                        }
                
                }
            
        }
            currentColorTurn = "red"
        }//chechCheck for proper move
    }
    
    
    func skip(to: Int, from: Int) {
        print("ORIGIONAL CHIPS HERE")
        print(game.p1Chips)
        print(game.p2Chips)
        print("/////////////////////")
        if cellArray[from].chipColor == "red" {
        if (to == from-14 && cellArray[from-7].chipColor == "black") {
            cellArray[to].setImage(name: "redCheck")
            cellArray[from].setImage(name: "")
            cellArray[from-7].setImage(name: "")
            var temp = Chip()
            var i = 0
            
            for each in game.p2Chips {
                print("for each runs here")
                
                if each.location == from - 7 {
                    temp = each
            
                    game.p2Chips.remove(at: i)
                    print("Inside of skipped peice")
                }
                i += 1
            }
            game.p1ChipsStolen.append(temp)
    
            
        } else if (to == from-18 && cellArray[from-9].chipColor == "black") {
            cellArray[to].setImage(name: "redCheck")
            cellArray[from].setImage(name: "")
            cellArray[from-9].setImage(name: "")
            var temp = Chip()
            var i = 0
            for each in game.p2Chips {
                print("for each runs here")
                print(each.location)
                print(from-9)
                if each.location == from - 9 {
                    temp = each
                    game.p2Chips.remove(at: i)
                    print("Inside of skipped peice")
                }
                i += 1
            }
            game.p1ChipsStolen.append(temp)
        }
            
            print(game.p1ChipsStolen)
            print(game.p2Chips)
            
            
        } else { //black turn
            print("INSIDE OF BLACK SKIP")
            if (to == from+14 && cellArray[from+7].chipColor == "red") {
            
                cellArray[to].setImage(name: "blackCheck")
                cellArray[from].setImage(name: "")
            cellArray[from+7].setImage(name: "")
            var temp = Chip()
            var i = 0
            for each in game.p1Chips {
                print("for each runs here")
                if each.location == from + 9 {
                    temp = each
                    game.p1Chips.remove(at: i)
                    print("Inside of skipped peice")
                }
                i += 1
            }
            game.p2ChipsStolen.append(temp)
            
            } else if (to == from+18 && cellArray[from+9].chipColor == "red") {
                
                cellArray[to].setImage(name: "blackCheck")
                cellArray[from].setImage(name: "")
                
                cellArray[from+9].setImage(name: "")
                var temp = Chip()
                var i = 0
                for each in game.p1Chips {
                    print("for each runs here")
                    if each.location == from + 9 {
                        temp = each
                        game.p1Chips.remove(at: i)
                        print("Inside of skipped peice")
                    }
                    i += 1
                }
                game.p2ChipsStolen.append(temp)
                
            }
        
        
        print(game.p2ChipsStolen)
        print(game.p1Chips)
        
    }
    }
}
