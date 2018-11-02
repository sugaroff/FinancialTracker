//
//  RecentCostsInteractor.swift
//  FinancialTracker
//
//  Created by sugaroff on 10/26/18.
//  Copyright © 2018 Dmitry Sakharov. All rights reserved.
//

import Foundation
import CoreData

class RecentCostsInteractor: NSObject {
    
    let coreDataContext: NSManagedObjectContext
    
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
    
    init(with context: NSManagedObjectContext) {
        self.coreDataContext = context
        super.init()
    }
    
    
    func getCosts(completion: ([BudgetItem]) -> Void) {
        do {
            try costsFRC.performFetch()
            let result = costsFRC.fetchedObjects!
            
            print("\nFetched  recent costs:")
            for item in result {
                print("Desc: \(item.category!)  Am: \(item.amount)  Date: \(item.date!.description)")
            }
        } catch {
            
        }
    }
    
    func addNewCost(_ cost: BudgetItem) {
        
    }
}

// MARK: NSFetchedResultsControllerDelegate implementation

extension RecentCostsInteractor : NSFetchedResultsControllerDelegate {
    
    private func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    }
    
    private func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
    }
    
    private func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    }
}
