//
//  RecentCostsViewModel.swift
//  FinancialTracker
//
//  Created by Admin on 08.10.2018.
//  Copyright © 2018 Dmitry Sakharov. All rights reserved.
//

import Foundation

class RecentCostsViewModel {
    
    private let dataManager: DataManagerProtocol
    private var costVMs: [CostViewModel] = [CostViewModel]()
    
    init(dataManager: DataManagerProtocol = DataManager.shared) {
        self.dataManager = dataManager
    }
    
    func numberOfSections() -> Int {
        return 1;
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return costVMs.count;
    }
    
    func getCostForIndexPath(_ indexPath: IndexPath) -> CostViewModel {
        return costVMs[indexPath.row]
    }
    
    func addNewCost(_ amount: Float, for category: String, description: String? = nil) {
        
    }
}


extension RecentCostsViewModel {
    
    private func fetchCosts() -> [CostViewModel] {
        let costModels = dataManager.getRecentCosts()
        
        return [CostViewModel]()
    }
    
    private func process(cost:BudgetItem) -> CostViewModel {
        let costVM = CostViewModel(category: cost.category!, amount: cost.amount, date: cost.date!, description: cost.desc)
        
        return costVM
    }
}


struct CostViewModel {
    let category: String
    let amount: Float
    let date: Date
    let description: String?
}
