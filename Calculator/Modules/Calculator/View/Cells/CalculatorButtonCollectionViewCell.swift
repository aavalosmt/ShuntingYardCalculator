//
//  CalculatorButtonCollectionViewCell.swift
//  Calculator
//
//  Created by Aldo Antonio Martinez Avalos on 8/7/19.
//  Copyright © 2019 aavalosmt. All rights reserved.
//

import UIKit

class CalculatorButtonCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet weak var symbolLabel: UILabel!
    
    // MARK: - Variables
    
    var model: ButtonViewModelProtocol?
    
    private var bgColor: UIColor {
        guard let type = model?.type else {
            return Colors.numberBGColor
        }
        switch type {
        case .number:
            return Colors.numberBGColor
        default: return Colors.operatorBGColor
        }
    }
    
    // MARK: - Cell LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        symbolLabel.textColor = .white
    }
    
    // MARK: - Public functions

    func configure(withModel model: ButtonViewModelProtocol) {
        self.model = model
        backgroundColor = bgColor
        
        symbolLabel.text = model.type.label
    }
    
}
