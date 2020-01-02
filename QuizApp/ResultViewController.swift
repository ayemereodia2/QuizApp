//
//  ResultViewController.swift
//  QuizApp
//
//  Created by Ayemere  Odia  on 02/01/2020.
//  Copyright © 2020 Ayemere  Odia . All rights reserved.
//

import Foundation
import UIKit

struct PresentableAnswer{
    let isCorrect:Bool
}

class CorrectAnswerCell:UITableViewCell{
    
}

class WrongAnswerCell:UITableViewCell{
    
}

class ResultViewController:UIViewController,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let answer = answers[indexPath.row]
        return answer.isCorrect ? CorrectAnswerCell():WrongAnswerCell()
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    private var summary = ""
    private var answers:[PresentableAnswer] = []
    @IBOutlet weak var headerLabel: UILabel!
    convenience init(summary:String, answers:[PresentableAnswer]){
        self.init()
        
        self.summary = summary
        self.answers = answers
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        headerLabel.text = summary
    }
    
}
