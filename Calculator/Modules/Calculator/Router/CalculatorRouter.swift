//
//  CalculatorRouter.swift
//  Calculator
//
//  Created by Aldo Antonio Martinez Avalos on 8/7/19.
//  Copyright © 2019 aavalosmt. All rights reserved.
//

import UIKit

class CalculatorRouter: CalculatorRouterProtocol {
    
    static func createModule() -> UIViewController {
        let view = CalculatorViewController()
        
        let interactor = CalculatorInteractor(
            getButtonsUseCase: GetButtonsImpl(
                factory: CalculatorButtonFactory()
            ),
            getReversePolishNotationUseCase: GetReversePolishNotationImpl(
                conversor: ShuntingYardAlgorithm()
            ),
            evaluatePostfixExpressionUsecase: EvaluatePostfixExpressionImpl(
                evaluator: PostfixExpressionEvaluatorImpl()
            )
        )
        
        let router = CalculatorRouter()
        
        let presenter = CalculatorPresenter(
            view: view,
            interactor: interactor,
            router: router
        )
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
    
}
