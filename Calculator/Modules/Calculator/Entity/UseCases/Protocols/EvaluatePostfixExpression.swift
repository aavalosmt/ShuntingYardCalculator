//
//  EvaluatePostfixExpression.swift
//  Calculator
//
//  Created by Aldo Antonio Martinez Avalos on 8/20/19.
//  Copyright © 2019 aavalosmt. All rights reserved.
//

import Foundation

protocol EvaluatePostfixExpression {
    
    var evaluator: PostfixExpressionEvaluator { get }
    
    func execute(from postFixExpression: [ExpressionToken]) -> Double 
    
}
