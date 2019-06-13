//
//  AnimatableSingleSectionTableViewController.swift
//  RxDataSourcesSingleSection_Example
//
//  Created by Meng Li on 2019/05/31.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import RxSwift
import UIKit
import Reusable
import RxDataSourcesSingleSection

class AnimatableSingleSectionTableViewController: UIViewController {
    
    private lazy var addBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
        barButtonItem.rx.tap.bind { [unowned self] in
            self.viewModel.add()
        }.disposed(by: disposeBag)
        return barButtonItem
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(cellType: PersonTableViewCell.self)
        return tableView
    }()
    
    private lazy var dataSource = PersonTableViewCell.tableViewAnimatedSingleSectionDataSource()
    
    private let viewModel: AnimatableSingleSectionTableViewModel
    private let disposeBag = DisposeBag()

    init(viewModel: AnimatableSingleSectionTableViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = addBarButtonItem
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
