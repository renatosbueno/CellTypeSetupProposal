//
//  MyInteractor.swift
//  CellTypeSetupProposal
//
//  Created by Renato Bueno on 11/03/20.
//  Copyright © 2020 Renato Bueno. All rights reserved.
//

import Foundation

struct MyObject {
    var title: String = ""
    var itens: [String] = []
    var footerTitle: String = ""
}

protocol MyInteractorProtocol {
    init(interactorDelegate: InteractorDelegate?)
    func makeRequest()
}

protocol InteractorDelegate: class {
    func didFinishRequest(withValue value: MyObject?)
}

final class MyInteractor: MyInteractorProtocol {
    
    private weak var interactorDelegate: InteractorDelegate?
    
    required init(interactorDelegate: InteractorDelegate?) {
        self.interactorDelegate = interactorDelegate
    }
    
    func makeRequest() {
        let itens: [String] = ["Item1", "Item2", "Item3", "Item4", "Item5", "Item6"]
        let object = MyObject(title: "This is a title",
                              itens: itens,
                              footerTitle: "This is a footer")
        interactorDelegate?.didFinishRequest(withValue: object)
    }
    
}
