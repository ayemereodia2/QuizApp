//
//  QuestionViewControllerTest.swift
//  QuizAppTests
//
//  Created by Ayemere  Odia  on 30/12/2019.
//  Copyright © 2019 Ayemere  Odia . All rights reserved.
//

import Foundation
import XCTest
@testable import QuizApp
class QuestionViewControllerTest:XCTestCase{
    
    //to test view controllers,
    //you need to load the view
    //you need to start the view life cycle
    
    func test_viewDidLoad_Question_HeaderText(){
        
        let sut = makeSUT(question: "Q1")
        XCTAssertEqual(sut.headerLabel.text, "Q1")
    }
    
    func test_viewDidLoad_With_No_Options_Renders_ZeroOptions(){
           
        let sut = makeSUT(question: "Q1")
        XCTAssertEqual(sut.tableView.numberOfRows(inSection:0), 0)
       }
    
    func test_viewDidLoad_With_One_Option_Renders_One_Options(){
        
        let sut = makeSUT(question: "Q1", options: ["A1","A2"])
     XCTAssertEqual(sut.tableView.numberOfRows(inSection:0), 2)
    }
    
    func test_viewDidLoad_With_One_Option_Renders_One_OptionText(){
        
     let sut = makeSUT(question: "Q1", options: ["A1","A2"])
        XCTAssertEqual(sut.tableView.title(at: 1), "A2")
        
    }
    
    func test_optionsSelected_Notifies_Delegate(){
        // delegate could be a callBack or a closure
        //used closure to capture the selected answer
        
        var receivedAnswer = [String]()
        //GIVEN //Arrange
        let sut = makeSUT(options: ["A1"]){ answer in
            
            receivedAnswer = answer
        }
        //WHEN  //Act
        sut.tableView.select(row: 0)
        
        //THEN  //Assert
        XCTAssertEqual(receivedAnswer, ["A1"])
    }
    
    
    //this
    func test_optionsSelected_With_Single_Options_Notifies_Delegate_When_SelectionChanges(){
        // delegate could be a callBack or a closure
        //used closure to capture the selected answer
        
        var receivedAnswer = [String]()
        //GIVEN //Arrange
        let sut = makeSUT(options: ["A1","A2"]){ answer in
            
            receivedAnswer = answer
        }
        //WHEN  //Act
        sut.tableView.select(row: 0)

        //THEN  //Assert
        XCTAssertEqual(receivedAnswer, ["A1"])
        
        sut.tableView.select(row: 1)
        XCTAssertEqual(receivedAnswer, ["A2"])

    }
    
    //that
    func test_options_Deselected_With_Single_Option_Does_Not_Notify_Delegate_With_EmptySelection(){
        // delegate could be a callBack or a closure
        //used closure to capture the selected answer
        var callBackCount = 0
        
        var receivedAnswer = [String]()
        //GIVEN //Arrange
        let sut = makeSUT(options: ["A1","A2"]){ answer in
            
            receivedAnswer = answer
            callBackCount += 1
        }
        //WHEN  //Act
        sut.tableView.select(row: 0)

        //THEN  //Assert
        XCTAssertEqual(receivedAnswer, ["A1"])
        XCTAssertEqual(callBackCount, 1)

        sut.tableView.deselect(row: 0)
        XCTAssertEqual(receivedAnswer, ["A1"])
        XCTAssertEqual(callBackCount, 1)

    }
    
    func test_optionsSelected_With_MultipleSelectionEnabledNotifies_Delegate_Selection(){
        // delegate could be a callBack or a closure
        //used closure to capture the selected answer

        var receivedAnswer = [String]()
        //GIVEN //Arrange
        let sut = makeSUT(options: ["A1","A2"]){ answer in

            receivedAnswer = answer
        }
        sut.tableView.allowsMultipleSelection = true
        //WHEN  //Act
        sut.tableView.select(row: 0)
        
        XCTAssertEqual(receivedAnswer, ["A1"])
        
        sut.tableView.select(row: 1)

        //THEN  //Assert
        XCTAssertEqual(receivedAnswer, ["A1","A2"])

    }
    
    func test_optionsDeselected_With_MultipleSelectionEnabledNotifies_Delegate_Selection(){
           // delegate could be a callBack or a closure
           //used closure to capture the selected answer

           var receivedAnswer = [String]()
           //GIVEN //Arrange
           let sut = makeSUT(options: ["A1","A2"]){ answer in

               receivedAnswer = answer
           }
           sut.tableView.allowsMultipleSelection = true
           //WHEN  //Act
           sut.tableView.select(row: 0)
           
           XCTAssertEqual(receivedAnswer, ["A1"])
           
           sut.tableView.deselect(row: 0)

           //THEN  //Assert
           XCTAssertEqual(receivedAnswer, [])

       }
    
}


// MARK :- Refactoring

func makeSUT(question:String = "", options:[String] = [], selection: @escaping ([String])->Void = {_ in})->QuestionViewController{
    
    let sut = QuestionViewController(question:question,options:options,selection:selection)
    
    _ = sut.view //load view
    
    return sut
}



