//
//  TodayViewController.swift
//  FinancialTrackerTodayExtension
//
//  Created by Admin on 26.09.2018.
//  Copyright © 2018 Dmitry Sakharov. All rights reserved.
//

import UIKit
import NotificationCenter
import CoreData

class TodayViewController: UIViewController, NCWidgetProviding {
    
    lazy var coreDataContext = CoreDataStack.shared.persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
        
        extensionContext?.widgetLargestAvailableDisplayMode = .expanded
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
        
        let fetchRequest: NSFetchRequest<BudgetItem> = BudgetItem.fetchRequest()
        let result: [BudgetItem]
        do {
            result = try coreDataContext.fetch(fetchRequest)
            print("WIDGET FETCH")
            
            for item in result {
                print("Desc: \(item.category!)  Am: \(item.amount)  Date: \(item.date!.description)")
            }
            
        } catch let error as NSError {
            print(error)
        }
    }
    
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        if activeDisplayMode == .expanded {
            preferredContentSize = CGSize(width: 0, height: 176)
        } else {
            preferredContentSize = maxSize
        }
    }
    
    @IBAction func categorySelected(_ sender: UIButton) {
        // First we check if the view controller managed object context is not nil.
        //
        // But since we are not cleaning this instance, on our case,
        // the guard will always return a valid context.
        //
        // But despite that, let's have the correct way to use a optional variable.
        
        
        
        // Using the Managed Object Context, lets create a new entry into entity "Task".
        let object = NSEntityDescription.insertNewObject(forEntityName: "BudgetItem", into: coreDataContext) as? BudgetItem
        
        // And update his attributes.
        // Since we didn't create a user interface to input text,
        // lets use the current date description as a name, and by default we set
        // the attribute "completed" to false.
        object?.category = "Food"
        object?.amount = 20
        object?.date = Date()
        
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
