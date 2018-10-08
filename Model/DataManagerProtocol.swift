//
//  DataManagerProtocol.swift
//  FinancialTracker
//
//  Created by Admin on 08.10.2018.
//  Copyright © 2018 Dmitry Sakharov. All rights reserved.
//

import Foundation

protocol DataManagerProtocol {
    func getRecentCosts() throws -> [BudgetItem]
    func insertNewCost(_ cost: BudgetItem)
}
