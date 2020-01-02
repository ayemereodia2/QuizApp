//
//  QuestionViewController.swift
//  QuizApp
//
//  Created by Ayemere  Odia  on 30/12/2019.
//  Copyright © 2019 Ayemere  Odia . All rights reserved.
//

import Foundation
import UIKit

class QuestionViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerLabel: UILabel!
    private var question:String = ""
    private var options:[String] = []
    private var selection:(([String])->Void)? = nil
    
    private let cellId = "Cell"
    
    convenience init(question:String, options:[String], selection: @escaping([String])->Void) {
        self.init()
        self.question = question
        self.options = options
        self.selection = selection
    }
    
    override func viewDidLoad() {
        headerLabel.text = question
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = dequeueCell(in: tableView)
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selection?(selected(in: tableView))
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if tableView.allowsMultipleSelection{
            selection?(selected(in: tableView))

        }
    }
    
    private func selected(in tableView:UITableView)->[String]{
        
        guard let indexPath = tableView.indexPathsForSelectedRows else {return []}
        return indexPath.map{options[$0.row]}
    }
    

    
    private func dequeueCell(in tableView:UITableView)->UITableViewCell{
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId){
            return cell
        }else{
            return UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
    }
}
