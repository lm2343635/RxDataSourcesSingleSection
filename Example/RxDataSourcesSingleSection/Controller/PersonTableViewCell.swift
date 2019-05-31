//
//  PersonTableViewCell.swift
//  RxDataSourcesSingleSection_Example
//
//  Created by Meng Li on 2019/05/31.
//  Copyright © 2019 MuShare. All rights reserved.
//

import UIKit
import Fakery
import RxDataSourcesSingleSection
import SnapKit

struct Person {
    var id: String
    var name: String
    var company: String
    
    static let faker = Faker()
    static func fake() -> Person {
        return Person(id: UUID().uuidString, name: faker.name.name(), company: faker.company.name())
    }
}

extension Person: AnimatableModel {
    
    typealias Identity = String
    
    var identity: String {
        return id
    }
    
}

class PersonTableViewCell: UITableViewCell {
    
    private lazy var nameLabel = UILabel()
    
    private lazy var companyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .lightGray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        addSubview(nameLabel)
        addSubview(companyLabel)
        
        createConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createConstraints() {
        
        nameLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(17)
            $0.top.equalToSuperview().offset(7)
        }
        
        companyLabel.snp.makeConstraints {
            $0.left.equalTo(nameLabel)
            $0.top.equalTo(nameLabel.snp.bottom).offset(5)
            $0.bottom.equalToSuperview().offset(-5)
        }
        
    }
    
}

extension PersonTableViewCell: Configurable {

    typealias Model = Person
    
    func configure(_ model: Person) {
        nameLabel.text = model.name
        companyLabel.text = model.company
    }
    
}
