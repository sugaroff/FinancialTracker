//
//  DataManagerProtocol.swift
//  FinancialTracker
//
//  Created by Admin on 08.10.2018.
//  Copyright © 2018 Dmitry Sakharov. All rights reserved.
//

import Foundation

protocol DataManagerProtocol {
    static var shared: DataManagerProtocol { get }
    
    var willChangeContent: (() -> Void)? { get set }
    var didChangeContent: (() -> Void)? { get set }
//    var didInsertObj
    
    func getRecentCosts() throws -> [BudgetItem]
    func insertNewCost(amount: Float, category: String, date: Date, description: String?)
    
    
}










import UIKit
import CoreData

extension UITableViewController : NSFetchedResultsControllerDelegate {
    
    private func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        /*This delegate method will be called first.As the name of this method "controllerWillChangeContent" suggets write some logic for table view to initiate insert row or delete row or update row process. After beginUpdates method the next call will be for :
         
         - (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(nullable NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(nullable NSIndexPath *)newIndexPath
         
         */
 
        tableView.beginUpdates()
    }
    
    /*This delegate method will be called second. This method will give information about what operation exactly started taking place a insert, a update, a delete or a move. The enum NSFetchedResultsChangeType will provide the change types.
     
     
     public enum NSFetchedResultsChangeType : UInt {
     
     case insert
     
     case delete
     
     case move
     
     case update
     }
     
     */
    private func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch (type) {
        case .insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break;
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break;
        case .update:
            if let indexPath = indexPath, let _ = tableView.cellForRow(at: indexPath) {
                //configureCell(cell, at: indexPath)
            }
            break;
            
        case .move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            
            if let newIndexPath = newIndexPath {
                tableView.insertRows(at: [newIndexPath], with: .fade)
            }
            break;
            
        }
    }
    
    /*The last delegate call*/
    private func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        /*finally balance beginUpdates with endupdates*/
        tableView.endUpdates()
    }
}
