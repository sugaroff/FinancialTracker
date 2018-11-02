//
//  BudgetItemMO+CoreDataClass.swift
//  FinancialTracker
//
//  Created by sugaroff on 10/31/18.
//  Copyright © 2018 Dmitry Sakharov. All rights reserved.
//
//

import Foundation
import CoreData

@objc(BudgetItemMO)
public class BudgetItemMO: NSManagedObject {

    func toBudgetItem() -> BudgetItem {
        
        let budgetItem = BudgetItem(
            amount: amount,
            date: date! as Date,
            category: category!,
            description: comment)
        
        return budgetItem
    }
    
    func fromBudgetItem(_ budgetItem: BudgetItem) {
        amount = budgetItem.amount
        category = budgetItem.category
        date = budgetItem.date as NSDate
        comment = budgetItem.comment
    }
}
