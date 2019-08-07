//
//  Router.swift
//  Calculator
//
//  Created by Aldo Antonio Martinez Avalos on 8/6/19.
//  Copyright © 2019 aavalosmt. All rights reserved.
//

import Foundation

protocol Router {
    var parent: Router? { get }
}

class BaseRouter: Router {
    
    var parent: Router? {
        return parentRouter
    }
    
    weak var parentRouter: BaseRouter?
    
    init(parent: BaseRouter? = nil) {
        self.parentRouter = parent
    }
    
}
