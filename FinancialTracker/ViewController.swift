//
//  ViewController.swift
//  FinancialTracker
//
//  Created by Admin on 20.09.2018.
//  Copyright © 2018 Dmitry Sakharov. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let coreDataContext = CoreDataStack.shared.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<BudgetItem> = BudgetItem.fetchRequest()
        let result: [BudgetItem]
        do {
            result = try coreDataContext.fetch(fetchRequest)
            print("APP FETCH")
            
            for item in result {
                print("Desc: \(item.desc!)  Am: \(item.amount)  Date: \(item.date!.description)")
            }
            
        } catch let error as NSError {
            print(error)
        }
    }

}

