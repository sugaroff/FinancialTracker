//
//  RecentCostsViewModel.swift
//  FinancialTracker
//
//  Created by Admin on 08.10.2018.
//  Copyright © 2018 Dmitry Sakharov. All rights reserved.
//

import Foundation

class RecentCostsViewModel {
    
    private let costsProvider: DataProvider<BudgetItemMO>
    private var costVMs: [CostViewModel] = [CostViewModel]()
    
    init(costsProvider: DataProvider<BudgetItemMO>) {
        self.costsProvider = costsProvider
    }
    
    func numberOfSections() -> Int {
        return 1;
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return costVMs.count;
    }
    
    func getCostVMForIndexPath(_ indexPath: IndexPath) -> CostViewModel {
        return costVMs[indexPath.row]
    }
}

// MARK: Events

extension RecentCostsViewModel {
    
    func addNewCost(amount: Float, category: String, description: String? = nil) {
        dataManager.insertNewCost(amount: amount, category: category, date: Date(), description: description)
    }
}

// MARK: Fetch data

extension RecentCostsViewModel {
    
    func fetch(complete: @escaping (_ success: Bool) -> Void) {
        do {
            let costModels = try costsProvider.getRecentCosts()
            
            costVMs.removeAll()
            for costModel in costModels {
                let costvm = process(costModel: costModel)
                costVMs.append(costvm)
            }
            
            complete(true)
        } catch {
            complete(false)
            print(error)
        }
    }
    
    private func process(costModel:BudgetItemMO) -> CostViewModel {
        let costVM = CostViewModel(category: costModel.category!, amount: costModel.amount, date: costModel.date!, description: costModel.desc)
        
        return costVM
    }
}


struct CostViewModel {
    let category: String
    let amount: Float
    let date: Date
    let description: String?
}
