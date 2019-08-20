//
//  ShuntingYardAlgorithmTests.swift
//  CalculatorTests
//
//  Created by Aldo Antonio Martinez Avalos on 8/7/19.
//  Copyright © 2019 aavalosmt. All rights reserved.
//

import XCTest
@testable import Calculator

class ShuntingYardAlgorithmTests: XCTestCase {
    
    var algorithm: ShuntingYardAlgorithm!
    
    override func setUp() {
        super.setUp()
        algorithm = ShuntingYardAlgorithm()
    }
    
    override func tearDown() {
        super.tearDown()
        algorithm = nil
    }
    
    func testSimpleExpressionConversion() {
        let simpleExpression = "4 + 4 * 2 / ( 1 - 5 )"
        let expectedResultExpression = "442*15-/+"
        
        let result = algorithm.convert(fromExpression: simpleExpression).values.map({ $0.token })
        
        XCTAssertEqual(expectedResultExpression, result.joined())
    }
    
}
