//
//  ShuntingYardAlgorithm.swift
//  Calculator
//
//  Created by Aldo Antonio Martinez Avalos on 8/7/19.
//  Copyright © 2019 aavalosmt. All rights reserved.
//

import Foundation

class ShuntingYardAlgorithm: PostFixExpressionConversor {
    
    private let operators = "+-/*^"
    private let parenthesis = "()"
    private let operands = "1234567890"
    
    private lazy var stack: Stack<ExpressionToken> = Stack()
    private lazy var postFixStack: Stack<ExpressionToken> = Stack()
    
    func convert(fromExpression expression: String) -> Stack<ExpressionToken> {
        stack.empty()
        postFixStack.empty()
        
        var tokenizedExpression = expression.replacingOccurrences(of: " ", with: "")
        
        while !tokenizedExpression.isEmpty {
            
            if let tokenOperator = readOperator(expression: &tokenizedExpression) {
                handleOperator(tokenOperator)
                continue
            }
            
            if let parenthesis = readParenthesis(expression: &tokenizedExpression) {
                handleParenthesis(parenthesis: parenthesis)
                continue
            }
            
            if let operand = readOperand(expression: &tokenizedExpression) {
                postFixStack.push(value:
                    ExpressionToken(
                        type: .operand(value: operand)
                    )
                )
            }
        }
        
        while !stack.isEmpty {
            if let value = stack.pop() {
                postFixStack.push(value: value)
            }
        }
        
        return postFixStack
    }
    
    private func handleOperator(_ tokenOperator: Operator) {
        while let topToken = stack.peek(), case .operator = topToken.type {
            
            var topOperator: Operator!
           
            switch topToken.type {
            case .operator(let type):
                topOperator = type
            default: break
            }
            
            guard (tokenOperator.associativity == .left && tokenOperator.precedence <= topOperator!.precedence) || (tokenOperator.associativity == .right && tokenOperator.precedence < topOperator!.precedence) else {
                break
            }
                
            let poppedOperator = stack.pop()!
            postFixStack.push(value: poppedOperator)
        }
        
        stack.push(value:
            ExpressionToken(type: .operator(type: tokenOperator))
        )
    }
    
    private func handleParenthesis(parenthesis: Parenthesis) {
        switch parenthesis {
        case .left:
            stack.push(value:
                ExpressionToken(
                    type: .parenthesis(type: .left)
                )
            )
            
        case .right:
            while let nextToken = stack.peek() {
                
                switch nextToken.type {
                case .parenthesis(let type):
                    if case .left = type {
                        _ = stack.pop()
                    }
                default: break
                }
                
                
                let tokenToAdd = stack.pop()!
                postFixStack.push(value: tokenToAdd)
            }
        }
    }
    
    private func isOperator(token: Character) -> Bool {
        return operators.contains(token)
    }
    
    private func isOperand(token: Character) -> Bool {
        return operands.contains(token)
    }
    
    private func isParenthesis(token: Character) -> Bool {
        return parenthesis.contains(token)
    }
    
    private func readOperand(expression: inout String) -> String? {
        var operand: String = ""
        
        for character in expression {
            if isOperand(token: character) {
                operand += String(character)
                expression.removeFirst()
            } else {
                return operand
            }
        }
        return nil
    }
    
    private func readOperator(expression: inout String) -> Operator? {
        guard let firstToken = expression.first else {
            return nil
        }
        
        if isOperator(token: firstToken) {
            expression.removeFirst()
            return Operator(rawValue: String(firstToken))
        }
        
        return nil
    }
    
    private func readParenthesis(expression: inout String) -> Parenthesis? {
        guard let firstToken = expression.first else {
            return nil
        }
        
        if isParenthesis(token: firstToken) {
            expression.removeFirst()
            return Parenthesis(rawValue: String(firstToken))
        }
        
        return nil
    }
}
