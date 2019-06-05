//
//  CompanyTableViewCell.swift
//  RxDataSourcesSingleSection_Example
//
//  Created by Meng Li on 2019/06/05.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import Fakery
import RxDataSourcesSingleSection
import Kingfisher

struct Company {
    
    let id = UUID().uuidString
    var name: String
    var logo: String
    var phone: String
    
    static let faker = Faker()
    static func fake() -> Company {
        return Company(name: faker.company.name(), logo: faker.company.logo(), phone: faker.phoneNumber.phoneNumber())
    }
}

class CompanyTableViewCell: UITableViewCell {
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private lazy var nameLabel = UILabel()
    
    private lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .lightGray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(logoImageView)
        addSubview(nameLabel)
        addSubview(phoneLabel)
        createConstrinats()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createConstrinats() {
        
        logoImageView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(20)
            $0.top.equalTo(nameLabel)
            $0.bottom.equalTo(phoneLabel)
            $0.width.equalTo(logoImageView.snp.height)
        }
        
        nameLabel.snp.makeConstraints {
            $0.left.equalTo(logoImageView.snp.right).offset(10)
            $0.top.equalToSuperview().offset(10)
        }
        
        phoneLabel.snp.makeConstraints {
            $0.left.equalTo(nameLabel)
            $0.top.equalTo(nameLabel.snp.bottom).offset(5)
            $0.bottom.equalToSuperview().offset(-8)
        }
        
    }
    
}

extension CompanyTableViewCell: Configurable {

    typealias Model = Company
    
    func configure(_ model: Company) {
        logoImageView.kf.setImage(with: URL(string: model.logo))
        nameLabel.text = model.name
        phoneLabel.text = model.phone
    }
    
}
