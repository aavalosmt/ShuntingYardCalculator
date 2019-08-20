//
//  PostfixExpressionEvaluatorImpl.swift
//  Calculator
//
//  Created by Aldo Antonio Martinez Avalos on 8/20/19.
//  Copyright © 2019 aavalosmt. All rights reserved.
//

import Foundation

class PostfixExpressionEvaluatorImpl: PostfixExpressionEvaluator {
    
    var stack: Stack<ExpressionToken> = Stack()
    
    func evaluate(postFixExpression: [ExpressionToken]) -> Double {
        
        for token in postFixExpression {
            switch token.type {
            case .operand:
                stack.push(value: token)
                
            case .operator(let type):
                guard stack.peek() != nil else {
                    break
                }
                
                let secondOperator = stack.pop()!
                
                guard stack.peek() != nil else {
                    stack.push(value: secondOperator)
                    break
                }
                
                let firstOperator = stack.pop()!
                
                let result = type.operate(lhs: Double(firstOperator.token) ?? 0.0,
                                          rhs: Double(secondOperator.token) ?? 0.0)
                
                let nextOperand = ExpressionToken(
                    type: .operand(value: String(result))
                )
                
                stack.push(value: nextOperand)
            default: break
            }
        }
        
        let result = stack.pop()
        return Double(result?.token ?? "") ?? 0.0
    }
    
}
