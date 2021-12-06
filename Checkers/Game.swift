//
//  Game.swift
//  Checkers
//
//  Created by Paige Keller on 12/3/21.
//

import Foundation

class Game {
    
    var p1Chips: [Int] = [1,2,3,4,5,6,7,8,9,10,11,12]
    var p1ChipsStolen: [Int] = []
    var p1Name: String!
    
    var p2Chips: [Int] = [1,2,3,4,5,6,7,8,9,10,11,12]
    var p2ChipsStolen: [Int] = []
    var p2Name: String!
    
    init(p1: String, p2: String) {
        p1Name = p1
        p2Name = p2
    }
    
    init() {
        
    }
    
}
