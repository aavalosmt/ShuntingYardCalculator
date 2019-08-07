//
//  ButtonViewModel.swift
//  Calculator
//
//  Created by Aldo Antonio Martinez Avalos on 8/7/19.
//  Copyright © 2019 aavalosmt. All rights reserved.
//

import Foundation

enum ButtonInteractionType {
    case addition
    case substraction
    case multiplication
    case division
    case operate
    case number(value: Int)
    
    var label: String {
        switch self {
        case .addition: return "+"
        case .substraction: return "-"
        case .multiplication: return "x"
        case .division: return "/"
        case .operate: return "="
        case .number(let value): return String(value)
        }
    }
}

protocol ButtonViewModelProtocol {
    var type: ButtonInteractionType { get }
}

struct ButtonViewModel: ButtonViewModelProtocol {
    var type: ButtonInteractionType
}
