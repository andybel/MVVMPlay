//
//  ListViewModelTests.swift
//  MVVM Protocols Play
//
//  Created by Andy Bell on 09/02/2017.
//  Copyright © 2017 snapp. All rights reserved.
//

import XCTest
@testable import MVVM_Protocols_Play

class ListViewModelTests: XCTestCase {
    
    var listVM = ListViewModel()
    
    override func setUp() {
        super.setUp()
        
        listVM.model = ["One","Two","Three","Four"]
    }
    
    func testViewModelreturnCorrectNumberOfItems() {
        XCTAssertEqual(listVM.numberOfItems, 4, "ListViewModel.numberOfItems() shoudl return correct items count")
    }
    
    func testViewModelReturnsCorrectItem(){
        XCTAssertEqual(listVM.itemAtIndex(2), "Three", "ListViewModelShouldreturn correct item")
    }
    
}
