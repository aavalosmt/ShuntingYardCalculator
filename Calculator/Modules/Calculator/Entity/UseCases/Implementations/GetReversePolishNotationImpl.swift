//
//  GetReversePolishNotationImpl.swift
//  Calculator
//
//  Created by Aldo Antonio Martinez Avalos on 8/7/19.
//  Copyright © 2019 aavalosmt. All rights reserved.
//

import Foundation

class GetReversePolishNotationImpl: GetReversePolishNotation {
    
    let conversor: PostFixExpressionConversor
    
    init(conversor: PostFixExpressionConversor) {
        self.conversor = conversor
    }
    
    func execute(fromExpression expression: String) -> Stack<ExpressionToken> {
        return conversor.convert(fromExpression: expression)
    }
    
}
