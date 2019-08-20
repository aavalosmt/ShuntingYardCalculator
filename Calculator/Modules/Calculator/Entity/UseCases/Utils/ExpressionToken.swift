//
//  ExpressionToken.swift
//  Calculator
//
//  Created by Aldo Antonio Martinez Avalos on 8/20/19.
//  Copyright © 2019 aavalosmt. All rights reserved.
//

import Foundation

enum Associativity {
    case left
    case right
}

enum Operator: String {
    case multiplication = "*"
    case addition = "+"
    case substraction = "-"
    case division = "/"
    case exponent = "^"
    
    var associativity: Associativity {
        switch self {
        case .exponent : return .right
        default: return .left
        }
    }
    
    var precedence: Int {
        switch self {
        case .addition, .substraction: return 0
        case .multiplication, .division: return 5
        case .exponent: return 10
        }
    }
}

enum Parenthesis: String {
    case left = "("
    case right = ")"
}

enum TokenType {
    case operand(value: String)
    case `operator`(type: Operator)
    case parenthesis(type: Parenthesis)
}

struct ExpressionToken {
    
    var type: TokenType
    var token: String
    
    init(type: TokenType) {
        switch type {
        case .operator(let op):
            self.token = op.rawValue
        case .operand(let value):
            self.token = value
        case .parenthesis(let parenthesis):
            self.token = parenthesis.rawValue
        }
        self.type = type
    }
    
}


