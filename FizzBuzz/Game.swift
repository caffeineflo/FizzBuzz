//
//  Game.swift
//  FizzBuzz
//
//  Created by @ynzc and used with permission by @caffeineflo.
//  Copyright © 2016 @ynzc. All rights reserved.
//

import Foundation

class Game: NSObject {
    
    var score: Int
    let brain: Brain
    
    override init() {
        
        score = 0
        brain = Brain()
        
        super.init()
    }
    
    func play(move: Move) -> (right: Bool, score: Int) {
        
        let result = brain.check(number: score + 1)
        
        if result == move {
            score += 1
            return (true, score)
        } else {
            return (false, score)
        }
    }
    
}
