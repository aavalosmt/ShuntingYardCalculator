//
//  GetReversePolishNotation.swift
//  Calculator
//
//  Created by Aldo Antonio Martinez Avalos on 8/7/19.
//  Copyright © 2019 aavalosmt. All rights reserved.
//

import Foundation

protocol PostFixExpressionConversor {
    func convert(fromExpression expression: String) -> Stack<ExpressionToken>
}

protocol GetReversePolishNotation {
    
    var conversor: PostFixExpressionConversor { get }
    
    func execute(fromExpression expression: String) -> Stack<ExpressionToken>
    
}
