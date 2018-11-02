//
//  RecentCostsViewModel.swift
//  FinancialTracker
//
//  Created by Admin on 08.10.2018.
//  Copyright © 2018 Dmitry Sakharov. All rights reserved.
//

import Foundation

class RecentCostsViewModel {
    
    private let interactor: RecentCostsInteractor
    private var costVMs: [CostViewModel] = [CostViewModel]()
    
    init(interactor: RecentCostsInteractor = RecentCostsInteractor()) {
        self.interactor = interactor
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
        let newCost = BudgetItem(amount: amount, category: category)
        interactor.addNewCost(newCost)
    }
}

// MARK: Fetch data

extension RecentCostsViewModel {
    
    func fetch(complete: @escaping () -> Void) {
        
        interactor.getCosts { (costs) in
            costVMs.removeAll()
            
            for cost in costs {
                let costvm = processCostModelToViewModel(cost)
                costVMs.append(costvm)
            }
            
            complete()
        }
    }
    
    private func processCostModelToViewModel(_ costModel:BudgetItem) -> CostViewModel {
        let costVM = CostViewModel(
            category: costModel.category,
            amount: costModel.amount,
            date: costModel.date,
            description: costModel.comment)
        
        return costVM
    }
}



struct CostViewModel {
    let category: String
    let amount: Float
    let date: Date
    let description: String?
}
