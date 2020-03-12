//
//  MyPresenter.swift
//  CellTypeSetupProposal
//
//  Created by Renato Bueno on 11/03/20.
//  Copyright © 2020 Renato Bueno. All rights reserved.
//

import Foundation

enum MyCellType {
    case title(String)
    case item(String)
    case footerDisclaimer(Int?)
}

final class MyPresenter: CellTypeSetupProtocol {
    
    private lazy var interactor: MyInteractorProtocol = MyInteractor(interactorDelegate: self)
    
    // DataSource
    
    private var value: MyObject = MyObject()
    
    // MARK: CellTypeSetupProtocol - Cell BUILDER SETUP
    
    typealias CellType = MyCellType
    
    var cellTypes: [MyCellType] = []

    func populateCells() {
        /// WE BUILD OUR CELL TYPES ACCORDING TO BUSINESS LOGIC, NOT INDEX, THAT WAY, ITS EASIER TO SCALATE TO A NEAR FUTURE ADDING MORE OR LESS CELLTYPES
        if !value.title.isEmpty {
            cellTypes.append(MyCellType.title(value.title))
        }
        _ = value.itens.map({ cellTypes.append(MyCellType.item($0)) })
        
        if !value.footerTitle.isEmpty {
            cellTypes.append(MyCellType.footerDisclaimer(Int(value.footerTitle)))
        }
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(inSection section: Int) -> Int {
        return cellTypes.count
    }
    
    func getCellType(atIndex index: IndexPath) -> MyCellType? {
        return cellTypes.object(index: index.row)
    }
    
    // MARK: LOAD CONTENT
    
    func loadContent() {
        interactor.makeRequest()
    }
    
}

extension MyPresenter: InteractorDelegate {
    
    func didFinishRequest(withValue value: MyObject?) {
        self.value = value ?? MyObject()
        populateCells()
    }
}


extension Array {
    func object(index: Int) -> Element? {
        if index >= 0 && index < self.count {
            return self[index]
        }
        return nil
    }
}
