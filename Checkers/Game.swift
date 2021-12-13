//
//  Game.swift
//  Checkers
//
//  Created by Paige Keller on 12/3/21.
//

import Foundation

class Game {
    
    var p1Chips: [Chip] = []
    var p1ChipsStolen: [Chip] = []
    var p1Name: String!
    
    var p2Chips: [Chip] = []
    var p2ChipsStolen: [Chip] = []
    var p2Name: String!
    
    init(p1: String, p2: String) {
        p1Name = p1
        p2Name = p2
    }
    
    init() {
        
    }
    
}
