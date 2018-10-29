//
//  DataProviderProtocol.swift
//  FinancialTracker
//
//  Created by Admin on 28.10.2018.
//  Copyright © 2018 Dmitry Sakharov. All rights reserved.
//

import Foundation


class DataProvider<ItemType> {
    
    func getData(response: @escaping (Response<[ItemType]>) -> Void) {
        fatalError("\(#function) doesn't implemented")
    }
    
    func insertNew(item: ItemType) {
        fatalError("\(#function) doesn't implemented")
    }
    
    var willChangeData: (() -> Void)?
    var didChangeData: (() -> Void)?
    var didChangeItem: ((_ changedItem: ItemType, _ changeType: ItemChangeType, _ oldIndex: IndexPath?, _ newIndex: IndexPath?) -> Void)?
    
    
    enum Response<DataType> {
        case success(DataType)
        case error()
    }
    
    enum ItemChangeType {
        case insert
        case changed
        case move
        case delete
    }
}
