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
    
    func getRecentCosts() throws -> [BudgetItem]
    func insertNewCost(amount: Float, category: String, date: Date, description: String?)
}
