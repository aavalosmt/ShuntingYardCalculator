//
//  PostfixExpressionEvaluator.swift
//  Calculator
//
//  Created by Aldo Antonio Martinez Avalos on 8/20/19.
//  Copyright © 2019 aavalosmt. All rights reserved.
//

import Foundation

protocol PostfixExpressionEvaluator {
    
    func evaluate(postFixExpression: [ExpressionToken]) -> Double
    
}
