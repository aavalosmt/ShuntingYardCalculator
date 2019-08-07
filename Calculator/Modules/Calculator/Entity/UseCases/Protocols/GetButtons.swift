//
//  GetButtons.swift
//  Calculator
//
//  Created by Aldo Antonio Martinez Avalos on 8/7/19.
//  Copyright © 2019 aavalosmt. All rights reserved.
//

import Foundation

protocol GetButtons {
    
    var factory: CalculatorButtonFactoryProtocol { get }
    
    func execute() -> [ButtonViewModelProtocol]
    
}
