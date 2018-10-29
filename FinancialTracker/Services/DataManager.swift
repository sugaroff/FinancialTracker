//
//  DataManager.swift
//  FinancialTracker
//
//  Created by Admin on 08.10.2018.
//  Copyright © 2018 Dmitry Sakharov. All rights reserved.
//

import Foundation
import CoreData

class DataManager : NSObject, DataManagerProtocol {
    
    var willChangeContent: (() -> Void)?
    var didChangeContent: (() -> Void)?
    
    
    static var shared: DataManagerProtocol = DataManager()
    
    lazy var coreDataContext = CoreDataStack.shared.persistentContainer.viewContext
    
    lazy var costsFRC: NSFetchedResultsController<BudgetItemMO> = {
        let fetchRequest: NSFetchRequest<BudgetItemMO> = BudgetItemMO.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        
        let frc = NSFetchedResultsController<BudgetItemMO>(
            fetchRequest: fetchRequest,
            managedObjectContext: coreDataContext,
            sectionNameKeyPath: nil,
            cacheName: nil)
        
        return frc
    }()
    
    private override init() {
        super.init()
    }
    
    
    func getRecentCosts() throws -> [BudgetItemMO] {
        try costsFRC.performFetch()
        let result = costsFRC.fetchedObjects!
        
        print("\nFetched costs:")
        for item in result {
            print("Desc: \(item.category!)  Am: \(item.amount)  Date: \(item.date!.description)")
        }
        
        return result
    }
    
    func insertNewCost(amount: Float, category: String, date: Date, description: String?) {
        let cost = BudgetItemMO(context: coreDataContext)
        cost.amount = amount
        cost.category = category
        cost.date = date
        cost.desc = description
        
        do {
            try coreDataContext.save()
        } catch {
            print(error)
        }
    }
}

// MARK: - NSFetchedResultsControllerDelegate conformance

extension DataManager : NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
    }
}


