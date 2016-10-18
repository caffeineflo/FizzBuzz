//
//  ViewControllerUnitTests.swift
//  FizzBuzz
//
//  Created by @ynzc and used with permission by @caffeineflo.
//  Copyright © 2016 @ynzc. All rights reserved.
//

import XCTest
@testable import FizzBuzz

class ViewControllerUnitTests: XCTestCase {
    
    var viewController: ViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        //Because in iOS architecture the view controller is tightly coupled to it’s view, we need to initialise the our Main.storyboard, then instantiate our ViewController from there.
        
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        viewController = storyBoard.instantiateViewController(withIdentifier: "viewController") as! ViewController
        
        UIApplication.shared.keyWindow!.rootViewController = viewController
        
        let _ = viewController.view
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testMoveIncrementsScore() {
        
        viewController.play(move: Move.Number)
        
        let newScore = viewController.gameScore
        
        XCTAssertEqual(newScore, 1)
    }
    
    func testHasGame() {
        
        XCTAssertNotNil(viewController.game)
    }
    
    func testFizzIncrementScore() {
        
        viewController.game?.score = 2
        viewController.play(move: Move.Fizz)
        
        let newScore = viewController.gameScore
        XCTAssertEqual(newScore, 3)
        
    }
    
    func testBuzzIncrementScore() {
        
        viewController.game?.score = 4
        viewController.play(move: Move.Buzz)
        
        let newScore = viewController.gameScore
        XCTAssertEqual(newScore, 5)
    }
 
    func testFizzBuzzIncrementScore() {
        
        viewController.game?.score = 14
        viewController.play(move: Move.FizzBuzz)
        
        let newScore = viewController.gameScore
        XCTAssertEqual(newScore, 15)
    }
    
}
