//
//  TableViewHelpers.swift
//  QuizAppTests
//
//  Created by Ayemere  Odia  on 02/01/2020.
//  Copyright © 2020 Ayemere  Odia . All rights reserved.
//

import UIKit

extension UITableView {

func cell(at row:Int)->UITableViewCell?{
    let indexPath = IndexPath(row:row, section: 0)
    
    return dataSource?.tableView(self, cellForRowAt:indexPath)
    
}

func title(at row:Int)->String?{
    return cell(at: row)?.textLabel?.text
}

func select(row:Int){
    let indexPath = IndexPath(row: row, section: 0)
    selectRow(at: indexPath, animated: false, scrollPosition: .none)
    delegate?.tableView?(self, didSelectRowAt:IndexPath(row:row, section: 0))
}

func deselect(row:Int){
    let indexPath = IndexPath(row: row, section: 0)
    deselectRow(at: indexPath, animated: false)
    delegate?.tableView?(self, didDeselectRowAt:IndexPath(row:row, section: 0))
}
}
