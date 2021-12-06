//
//  Game.swift
//  Checkers
//
//  Created by Paige Keller on 12/3/21.
//

import Foundation

class Game {
    
    var p1Chips: [Int: Bool] = [1: false, 2: false, 3: false, 4: false, 5: false, 6: false, 7: false, 8: false , 9: false , 10: false , 11: false , 12: false] //true = King
    var p1ChipsStolen: [Int: Bool] = [:]
    var p1Name: String!
    
    var p2Chips: [Int: Bool] = [1: false, 2: false, 3: false, 4: false, 5: false, 6: false, 7: false, 8: false , 9: false , 10: false , 11: false , 12: false] //true = King
    var p2ChipsStolen: [Int: Bool] = [:]
    var p2Name: String!
    
    init(p1: String, p2: String) {
        p1Name = p1
        p2Name = p2
    }
    
    init() {
        
    }
    
}
