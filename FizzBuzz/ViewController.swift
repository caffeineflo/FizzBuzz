//
//  ViewController.swift
//  Fizz Buzz
//
//  Created by @ynzc and used with permission by @caffeineflo.
//  Copyright © 2016 @ynzc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var gameScore: Int? {
        didSet {
            numberButton.setTitle("\(gameScore ?? 0)", for: UIControlState.normal)
            
        }
    }
    var game: Game?

    @IBOutlet weak var numberButton: UIButton!
    @IBOutlet weak var fizzButton: UIButton!
    @IBOutlet weak var buzzButton: UIButton!
    @IBOutlet weak var fizzBuzzButton: UIButton!
    
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        switch sender {
            
        case numberButton:
            play(move: Move.Number)
        case fizzButton:
            play(move: Move.Fizz)
        case buzzButton:
            play(move: Move.Buzz)
        case fizzBuzzButton:
            play(move: Move.FizzBuzz)
        default:
            print("Invalid selection")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        game = Game()
        gameScore = game?.score ?? 0
    }

    func play(move: Move) {
        
        guard let gameExists = game else {
            
            print("Something not so funny happened..")
            
            return
        }
            
        let response = gameExists.play(move: move)
        gameScore = response.score
    }

}

