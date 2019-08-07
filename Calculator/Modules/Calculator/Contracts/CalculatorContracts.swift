//
//  CalculatorContracts.swift
//  Calculator
//
//  Created by Aldo Antonio Martinez Avalos on 8/7/19.
//  Copyright © 2019 aavalosmt. All rights reserved.
//

import UIKit

protocol CalculatorRouterProtocol: class {
    static func createModule() -> UIViewController
}

protocol CalculatorPresenterProtocol: class {
    var view: CalculatorViewProtocol? { get }
    var interactor: CalculatorInputInteractorProtocol { get }
    var router: CalculatorRouterProtocol { get }
    
    func viewDidLoad()
}

protocol CalculatorInputInteractorProtocol: class {
    var presenter: CalculatorOutputInteractorProtocol? { get set }
    
    var getButtonsUseCase: GetButtons { get }
    
    func getButtons()
}

protocol CalculatorOutputInteractorProtocol: class {
    var interactor: CalculatorInputInteractorProtocol { get }
    var view: CalculatorViewProtocol? { get }
    
    func didFetchButtons(buttons: [ButtonViewModelProtocol])
}
