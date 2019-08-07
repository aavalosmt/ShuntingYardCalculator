//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Aldo Antonio Martinez Avalos on 8/7/19.
//  Copyright © 2019 aavalosmt. All rights reserved.
//

import UIKit

protocol CalculatorViewProtocol: class {
    var presenter: CalculatorPresenterProtocol? { get set }
    
    func showButtons(buttons: [ButtonViewModelProtocol])
}

class CalculatorViewController: UIViewController {

    var presenter: CalculatorPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
}

// MARK: - CalculatorViewProtocol

extension CalculatorViewController: CalculatorViewProtocol {
    
    func showButtons(buttons: [ButtonViewModelProtocol]) {
        
    }

}
