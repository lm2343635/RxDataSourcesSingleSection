//
//  MultiCellTypeSingleSectionTableViewController.swift
//  RxDataSourcesSingleSection_Example
//
//  Created by Meng Li on 2019/06/05.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSourcesSingleSection

class MultiCellTypeSingleSectionTableViewController: UIViewController {
    
    private let viewModel: MultiCellTypeSingleSectionTableViewModel
    private let disposeBag = DisposeBag()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(cellType: PersonTableViewCell.self)
        tableView.register(cellType: CompanyTableViewCell.self)
        return tableView
    }()
    
    private lazy var dataSource = TableViewSingleSectionDataSource<MultiModel>(configureCell: { _, tableView, indexPath, model in
        switch model {
        case .company(let company):
            return tableView.dequeueReusableCell(for: indexPath, model: company) as CompanyTableViewCell
        case .person(let person):
            return tableView.dequeueReusableCell(for: indexPath, model: person) as PersonTableViewCell
        }
    })

    init(viewModel: MultiCellTypeSingleSectionTableViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(tableView)
        createConstraints()
        
        viewModel.title.bind(to: rx.title).disposed(by: disposeBag)
        viewModel.infoSection.bind(to: tableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
    }
    
    private func createConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}
