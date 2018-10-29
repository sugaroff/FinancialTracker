//
//  DataProviderProtocol.swift
//  FinancialTracker
//
//  Created by Admin on 28.10.2018.
//  Copyright © 2018 Dmitry Sakharov. All rights reserved.
//

import Foundation


protocol DataProviderProtocol {
    
    associatedtype ItemType
    
    func getData(response: @escaping ([ItemType], Error) -> Void)
    func insertNew(item: ItemType)
    
    var willChangeData: (() -> Void)? { get set }
    var didChangeData: (() -> Void)? { get set }
    var didChangeItem: ((_ changedItem: ItemType, _ changeType: ChangeType, _ oldIndex: IndexPath?, _ newIndex: IndexPath?) -> Void)? { get set }
}


enum ChangeType {
    case insert
    case changed
    case move
    case delete
}
