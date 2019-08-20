//
//  StackTests.swift
//  CalculatorTests
//
//  Created by Aldo Antonio Martinez Avalos on 8/7/19.
//  Copyright © 2019 aavalosmt. All rights reserved.
//

import XCTest
@testable import Calculator

class StackTests: XCTestCase {
    
    var stack: Stack<Int>?
    
    override func setUp() {
        super.setUp()
        stack = Stack<Int>()
    }
    
    override func tearDown() {
        super.tearDown()
        stack = nil
    }
    
    func testStackPush() {
        stack?.push(value: 1)
        
        XCTAssertFalse(stack?.isEmpty ?? true, "Stack should have 1 element")
        stack?.empty()
    }
    
    func testStackPop() {
        stack?.push(value: 1)
        _ = stack?.pop()
        
        XCTAssertTrue(stack?.isEmpty ?? false, "Stack should be empty")
    }
    
    func testStackValues() {
        stack?.push(value: 1)
        stack?.push(value: 2)
        stack?.push(value: 3)
        
        XCTAssert(stack!.values.containsSameElements(as: [1,2,3]))
    }
    
}
