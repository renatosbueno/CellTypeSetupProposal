//
//  ViewController.swift
//  CellTypeSetupProposal
//
//  Created by Renato Bueno on 11/03/20.
//  Copyright © 2020 Renato Bueno. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private lazy var presenter: MyPresenter = MyPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.loadContent()
    }

    // MARK: CELL CREATION

    func createTitleCell(title: String) -> UITableViewCell {
        return UITableViewCell(frame: .zero)
    }
    
    func createItemCell(itemtitle: String) -> UITableViewCell {
        return UITableViewCell(frame: .zero)
    }
    
    func createFooterCell(count: Int?) -> UITableViewCell {
        return UITableViewCell(frame: .zero)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows(inSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellType = presenter.getCellType(atIndex: indexPath) else {
            return UITableViewCell()
        }
        switch cellType {
        case .title(let title):
            return createTitleCell(title: title)
            
        case .item(let itemtitle):
            return createItemCell(itemtitle: itemtitle)
            
        case .footerDisclaimer(let count):
            return createFooterCell(count: count)
        }
    }
    
}

