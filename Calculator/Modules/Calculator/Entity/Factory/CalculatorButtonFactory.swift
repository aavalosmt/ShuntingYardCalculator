//
//  CalculatorButtonFactory.swift
//  Calculator
//
//  Created by Aldo Antonio Martinez Avalos on 8/7/19.
//  Copyright © 2019 aavalosmt. All rights reserved.
//

import Foundation

protocol CalculatorButtonFactoryProtocol {
    func createModels() -> [ButtonViewModelProtocol]
}

class CalculatorButtonFactory: CalculatorButtonFactoryProtocol {
    
    func createModels() -> [ButtonViewModelProtocol] {
        var models: [ButtonViewModelProtocol] = []
        
        models.append(contentsOf: [
            ButtonViewModel(type: .number(value: 7)),
            ButtonViewModel(type: .number(value: 8)),
            ButtonViewModel(type: .number(value: 9)),
            ButtonViewModel(type: .addition),
            ButtonViewModel(type: .number(value: 4)),
            ButtonViewModel(type: .number(value: 5)),
            ButtonViewModel(type: .number(value: 6)),
            ButtonViewModel(type: .substraction),
            ButtonViewModel(type: .number(value: 1)),
            ButtonViewModel(type: .number(value: 2)),
            ButtonViewModel(type: .number(value: 3)),
            ButtonViewModel(type: .multiplication),
            ButtonViewModel(type: .operate),
            ButtonViewModel(type: .division)
        ])
        
        return models
    }
    
    
}
