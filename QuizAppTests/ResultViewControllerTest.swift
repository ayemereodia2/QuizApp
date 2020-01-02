//
//  ResultViewController.swift
//  QuizAppTests
//
//  Created by Ayemere  Odia  on 02/01/2020.
//  Copyright © 2020 Ayemere  Odia . All rights reserved.
//

import Foundation
import XCTest

@testable import QuizApp

class ResultViewControllerTest:XCTestCase{
    
    func test_viewDidLoad_Render_Summary(){
        
        let sut = makeSUT(summary:"a summary")
        XCTAssertEqual(sut.headerLabel.text, "a summary")
    }
    
    func test_viewDidLoad_Without_Answers_ShouldLoad_NoAnswers(){

        let sut = makeSUT(answers: [])

        XCTAssertEqual(sut.tableView.numberOfRows(inSection:0), 0)
    }
    
    func test_viewDidLoad_With_One_Answer_ShouldLoad_One_Answers(){

           let sut = makeSUT(answers: [makeDummyAnswer()])

           XCTAssertEqual(sut.tableView.numberOfRows(inSection:0), 1)
       }
    
    
    func test_viewDidLoad_With_Correct_Answer_Should_Render_Correct_Answer_Cell(){
        let sut = makeSUT(summary: "", answers: [PresentableAnswer(isCorrect: true)])
        let cell = sut.tableView.cell(at: 0) as? CorrectAnswerCell
        
        XCTAssertNotNil(cell)
    }
    
    
    func test_viewDidLoad_With_Wrong_Answer_Should_Render_Wrong_Answer_Cell(){
           let sut = makeSUT(summary: "", answers: [PresentableAnswer(isCorrect: false)])
           let cell = sut.tableView.cell(at: 0) as? WrongAnswerCell
           
           XCTAssertNotNil(cell)
       }
    // MARK :- Refactor
    
    func makeSUT(summary:String = "", answers:[PresentableAnswer] = [])->ResultViewController{
        
        let sut = ResultViewController(summary: summary, answers: answers)
        _ = sut.view
        
        return sut
    }
    
    func makeDummyAnswer()-> PresentableAnswer{
        return PresentableAnswer(isCorrect:false)
    }
}
