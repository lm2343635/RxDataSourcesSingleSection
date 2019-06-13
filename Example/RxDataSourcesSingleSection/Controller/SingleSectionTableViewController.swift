//
//  SingleSectionTableViewController.swift
//  RxDataSourcesSingleSection_Example
//
//  Created by Meng Li on 2019/05/31.
//  Copyright © 2019 MuShare. All rights reserved.
//

import RxSwift
import UIKit
import Reusable
import RxDataSourcesSingleSection

class SingleSectionTableViewController: UIViewController {
    
    private let viewModel: SingleSectionTableViewModel
    private let disposeBag = DisposeBag()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(cellType: PersonTableViewCell.self)
        return tableView
    }()
    
    private lazy var dataSource = PersonTableViewCell.tableViewSingleSectionDataSource()
    
    init(viewModel: SingleSectionTableViewModel) {
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
        viewModel.personSection.bind(to: tableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)
    }
    
    private func createConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}
