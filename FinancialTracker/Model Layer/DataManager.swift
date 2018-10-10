//
//  DataManager.swift
//  FinancialTracker
//
//  Created by Admin on 08.10.2018.
//  Copyright © 2018 Dmitry Sakharov. All rights reserved.
//

import Foundation
import CoreData

class DataManager : DataManagerProtocol {
    
    static var shared: DataManagerProtocol = DataManager()
    
    lazy var coreDataContext = CoreDataStack.shared.persistentContainer.viewContext
    
    private init() {
    }
    
    func getRecentCosts() throws -> [BudgetItem] {
        let fetchRequest: NSFetchRequest<BudgetItem> = BudgetItem.fetchRequest()
        
        let result: [BudgetItem]
        result = try coreDataContext.fetch(fetchRequest)
        
        print("Fetched costs:")
        for item in result {
            print("Desc: \(item.category!)  Am: \(item.amount)  Date: \(item.date!.description)")
        }
        
        return result
    }
    
    func insertNewCost(amount: Float, category: String, date: Date, description: String?) {
        /* // Using the Managed Object Context, lets create a new entry into entity "Task".
        let object = NSEntityDescription.insertNewObject(forEntityName: "BudgetItem", into: coreDataContext) as? BudgetItem
        
        // And update his attributes.
        // Since we didn't create a user interface to input text,
        // lets use the current date description as a name, and by default we set
        // the attribute "completed" to false.
        object?.desc = "Food"
        object?.amount = 100
        object?.date = Date() */
        
        let cost = BudgetItem(context: coreDataContext)
        cost.amount = amount
        cost.category = category
        cost.date = date
        cost.desc = description
        
        do {
            // Then we try to persist the new entry.
            // And if everything went successfull the fetched results controller
            // will react and from the delegate methods it will call the reload
            // of the table view.
            try coreDataContext.save()
        } catch {
            print(error)
        }
    }
    
    
}
