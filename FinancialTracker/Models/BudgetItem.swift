//
//  File.swift
//  FinancialTracker
//
//  Created by Admin on 28.10.2018.
//  Copyright © 2018 Dmitry Sakharov. All rights reserved.
//

import Foundation

struct BudgetItem {
    
    var amount: Float
    let date: Date
    let category: String
    var comment: String?
    
    
    init(amount: Float, date: Date, category: String, description: String?) {
        self.amount = amount
        self.date = date
        self.category = category
        self.comment = description
    }
    
    init(amount: Float, category: String) {
        self.init(amount: amount, date: Date(), category: category, description: nil)
    }
}



extension BudgetItem : CustomStringConvertible {
    
    var description: String {
        return "Cat: \(category)  Am: \(amount)  Date: \(date.description)"
    }
}
