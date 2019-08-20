//
//  CalculatorInteractor.swift
//  Calculator
//
//  Created by Aldo Antonio Martinez Avalos on 8/7/19.
//  Copyright © 2019 aavalosmt. All rights reserved.
//

import Foundation

class CalculatorInteractor: CalculatorInputInteractorProtocol {
    
    weak var presenter: CalculatorOutputInteractorProtocol?
    
    let getButtonsUseCase: GetButtons
    let getReversePolishNotationUseCase: GetReversePolishNotation
    let evaluatePostfixExpressionUsecase: EvaluatePostfixExpression
    
    init(getButtonsUseCase: GetButtons,
         getReversePolishNotationUseCase: GetReversePolishNotation,
         evaluatePostfixExpressionUsecase: EvaluatePostfixExpression) {
        self.getButtonsUseCase = getButtonsUseCase
        self.getReversePolishNotationUseCase = getReversePolishNotationUseCase
        self.evaluatePostfixExpressionUsecase = evaluatePostfixExpressionUsecase
    }
    
    func getButtons() {
        presenter?.didFetchButtons(buttons: getButtonsUseCase.execute())
    }
    
    func evaluateOperation(expression: String) {
        let rpn = getReversePolishNotationUseCase.execute(fromExpression: expression).values
        let result = evaluatePostfixExpressionUsecase.execute(from: rpn)
        presenter?.didEvaluateOperation(result: result)
    }
    
}
