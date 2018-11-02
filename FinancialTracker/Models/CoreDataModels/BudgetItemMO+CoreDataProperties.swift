//
//  BudgetItemMO+CoreDataProperties.swift
//  FinancialTracker
//
//  Created by sugaroff on 10/31/18.
//  Copyright © 2018 Dmitry Sakharov. All rights reserved.
//
//

import Foundation
import CoreData


extension BudgetItemMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BudgetItemMO> {
        return NSFetchRequest<BudgetItemMO>(entityName: "BudgetItemMO")
    }

    @NSManaged public var amount: Float
    @NSManaged public var category: String?
    @NSManaged public var date: Date?
    @NSManaged public var comment: String?

}
