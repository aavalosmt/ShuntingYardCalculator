//
//  GetButtonsImpl.swift
//  Calculator
//
//  Created by Aldo Antonio Martinez Avalos on 8/7/19.
//  Copyright © 2019 aavalosmt. All rights reserved.
//

import Foundation

class GetButtonsImpl: GetButtons {
    
    let factory: CalculatorButtonFactoryProtocol
    
    init(factory: CalculatorButtonFactoryProtocol) {
        self.factory = factory
    }
    
    func execute() -> [ButtonViewModelProtocol] {
        return factory.createModels()
    }
    
}
