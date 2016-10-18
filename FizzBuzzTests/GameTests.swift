//
//  GameTests.swift
//  FizzBuzz
//
//  Created by @ynzc and used with permission by @caffeineflo.
//  Copyright © 2016 @ynzc. All rights reserved.
//

import XCTest
@testable import FizzBuzz

class GameTests: XCTestCase {
    
    let game = Game()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGameStartsAtZero() {
        XCTAssertTrue(game.score == 0)
    }

    func testOnPlayerScoreIncremented() {
        game.play(move: Move.Number)
        XCTAssertTrue(game.score == 1)
    }
    
    func testIfMoveIsRight() {
        game.score = 2
        let response = game.play(move: Move.Fizz)
        let result = response.right
        XCTAssertEqual(result, true)
    }
    
    func testIfMoveIsWrong() {
        game.score = 1
        
        let response = game.play(move: Move.Fizz)
        let result = response.right
        XCTAssertEqual(result, false)
    }
    
    func testCorrectBuzzMove() {
        
        game.score = 4
        
        let response = game.play(move: Move.Buzz)
        let result = response.right
        XCTAssertEqual(result, true)
    }
    
    func testIncorrectBuzzMove() {
        
        game.score = 8
        
        let response = game.play(move: Move.Buzz)
        let result = response.right
        
        XCTAssertEqual(result, false)
    }
    
    func testCorrectFizzBuzzMove() {
        
        game.score = 14
        
        let response = game.play(move: Move.FizzBuzz)
        let result = response.right
        
        XCTAssertEqual(result, true)
        
    }
    
    func testIncorrectFizzBuzzMove() {
        
        game.score = 15
        
        let response = game.play(move: Move.FizzBuzz)
        let result = response.right
        
        XCTAssertEqual(result, false)
    }
    
    func testCorrectNumberMove() {
        game.score = 1
        
        let response = game.play(move: Move.Number)
        let result = response.right
        
        XCTAssertEqual(result, true)
        
    }
    
    func testIncorrectNumberMove() {
        
        game.score = 2
        
        let response = game.play(move: Move.Number)
        let result = response.right
        
        XCTAssertEqual(result, false)
    }
    
    func testIfMoveWrongScoreNotIncremented() {
        
        game.score = 1
        game.play(move: Move.Fizz)
        XCTAssertEqual(game.score, 1)
    }
    
    func testPlayShouldReturnIfMoveRight() {
        
        let response = game.play(move: Move.Number)
        XCTAssertNotNil(response.right)
    }
    
    func testPlayShouldReturnNewScore(){
        
        let response = game.play(move: Move.Number)
        XCTAssertNotNil(response.score)
    }
    
}
