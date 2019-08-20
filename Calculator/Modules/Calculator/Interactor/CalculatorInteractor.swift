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
    
    init(getButtonsUseCase: GetButtons,
         getReversePolishNotationUseCase: GetReversePolishNotation) {
        self.getButtonsUseCase = getButtonsUseCase
        self.getReversePolishNotationUseCase = getReversePolishNotationUseCase
    }
    
    func getButtons() {
        presenter?.didFetchButtons(buttons: getButtonsUseCase.execute())
    }
    
}
