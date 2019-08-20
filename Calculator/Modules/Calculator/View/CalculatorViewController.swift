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
    
    // MARK: - Variables
    
    var presenter: CalculatorPresenterProtocol?
    
    private var buttonsModels: [ButtonViewModelProtocol] = []
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - ViewController LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        presenter?.viewDidLoad()
    }
    
    private func configureUI() {
        configureCollectionView()
    }
    
}

// MARK: - CalculatorViewProtocol

extension CalculatorViewController: CalculatorViewProtocol {
    
    func showButtons(buttons: [ButtonViewModelProtocol]) {
        self.buttonsModels = buttons
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }

}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension CalculatorViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    private func configureCollectionView() {
        collectionView.register(identifier: CalculatorButtonCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalculatorButtonCollectionViewCell.identifier, for: indexPath) as? CalculatorButtonCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(withModel: buttonsModels[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttonsModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let buttonModel = buttonsModels[indexPath.row]
        let currentText = resultLabel.text ?? ""
        
        switch buttonModel.type {
        case .operate:
            break
        default:
            resultLabel.text = currentText + buttonModel.type.label
        }
    }
    
}

extension CalculatorViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.size.width / 4.0) - 7.5
        return CGSize(width: width, height: width)
    }
    
}
