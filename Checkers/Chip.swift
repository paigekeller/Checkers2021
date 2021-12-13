//
//  Chip.swift
//  Checkers
//
//  Created by Paige Keller on 12/13/21.
//

import Foundation

class Chip {

    
    
    var king: Bool = false
    var onBoard: Bool = true
    var chipColor: String = ""
    var location: Int = 0
    
    init(color: String, loc: Int) {
        
        chipColor = color
        location = loc
        
    }
    
    init() {
        
    }
    
    
}
