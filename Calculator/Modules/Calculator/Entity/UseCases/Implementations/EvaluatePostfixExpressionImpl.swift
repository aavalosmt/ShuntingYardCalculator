//
//  EvaluatePostfixExpressionImpl.swift
//  Calculator
//
//  Created by Aldo Antonio Martinez Avalos on 8/20/19.
//  Copyright © 2019 aavalosmt. All rights reserved.
//

import Foundation

class EvaluatePostfixExpressionImpl: EvaluatePostfixExpression {
    
    let evaluator: PostfixExpressionEvaluator
    
    init(evaluator: PostfixExpressionEvaluator) {
        self.evaluator = evaluator
    }
    
    func execute(from postFixExpression: [ExpressionToken]) -> Double {
        return evaluator.evaluate(postFixExpression: postFixExpression)
    }
    
}
