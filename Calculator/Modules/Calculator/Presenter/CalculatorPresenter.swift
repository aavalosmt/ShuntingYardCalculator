//
//  CalculatorPresenter.swift
//  Calculator
//
//  Created by Aldo Antonio Martinez Avalos on 8/7/19.
//  Copyright © 2019 aavalosmt. All rights reserved.
//

import Foundation

class CalculatorPresenter: CalculatorPresenterProtocol {
    
    weak var view: CalculatorViewProtocol?
    var interactor: CalculatorInputInteractorProtocol
    var router: CalculatorRouterProtocol
    
    init(view: CalculatorViewProtocol,
         interactor: CalculatorInputInteractorProtocol,
         router: CalculatorRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        interactor.getButtons()
    }
    
    func evaluateOperation(expression: String) {
        interactor.evaluateOperation(expression: expression)
    }
    
}

// MARK: - CalculatorOututInteractorProtocol

extension CalculatorPresenter: CalculatorOutputInteractorProtocol {
    
    func didFetchButtons(buttons: [ButtonViewModelProtocol]) {
        view?.showButtons(buttons: buttons)
    }
    
    func didEvaluateOperation(result: Double) {
        view?.showResult(result: result)
    }
    
    func didFailedToEvaluateOperation() {
        
    }
}
