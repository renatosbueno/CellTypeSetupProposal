//
//  CellTypeProtocol.swift
//  CellTypeSetupProposal
//
//  Created by Renato Bueno on 11/03/20.
//  Copyright © 2020 Renato Bueno. All rights reserved.
//

import UIKit

protocol CellTypeParentSetupProtocol {
    associatedtype CellType
    func populateCells()
    func numberOfSections() -> Int
    func numberOfRows(inSection section: Int) -> Int
    func getCellType(atIndex index: IndexPath) -> CellType?
}

/// For multiple section lists

protocol CellTypeSectionedSetupProtocol: CellTypeParentSetupProtocol {
    var cellTypes: [[CellType]] { get set }
}

/// For single section lists

protocol CellTypeSetupProtocol: CellTypeParentSetupProtocol {
    var cellTypes: [CellType] { get set }
}


