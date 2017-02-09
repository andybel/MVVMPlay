//
//  ListViewModel.swift
//  MVVM Protocols Play
//
//  Created by Andy Bell on 08/02/2017.
//  Copyright © 2017 snapp. All rights reserved.
//

import Foundation

// TODO: update this when ready
typealias DataItem = String

protocol ListViewModelViewDelegate: class {
    func itemsDidChange(viewModel: ListViewModel)
}

protocol ListViewModelCoordinatorDelegate: class
{
    func listViewModelDidSelectData(_ viewModel: ListViewModel, data: DataItem)
}

protocol ListViewModelDelegate {
    
    var model: [DataItem]? { get set }
    var viewDelegate: ListViewModelViewDelegate? { get set }
    var coordinatorDelegate: ListViewModelCoordinatorDelegate? { get set}
    var title: String { get }
    var numberOfItems: Int { get }
    
    func itemAtIndex(_ index: Int) -> DataItem?
    func useItemAtIndex(_ index: Int)
    
}

class ListViewModel: ListViewModelDelegate {
    
    internal var title: String {
        return "Countries"
    }
    
    weak var viewDelegate: ListViewModelViewDelegate?
    weak var coordinatorDelegate: ListViewModelCoordinatorDelegate?
    
    internal var model: [DataItem]? {
        didSet {
            items = nil;
            self.items = model
        }
    }

    fileprivate var items: [DataItem]? {
        didSet {
            viewDelegate?.itemsDidChange(viewModel: self)
        }
    }

    internal var numberOfItems: Int {
        if let items = items {
            return items.count
        }
        return 0
    }
    
    internal func useItemAtIndex(_ index: Int) {
        coordinatorDelegate?.listViewModelDidSelectData(self, data: items![index])
    }
    
    internal func itemAtIndex(_ index: Int) -> DataItem? {
        if let items = items , items.count > index {
            return items[index]
        }
        return nil
    }
    
}
