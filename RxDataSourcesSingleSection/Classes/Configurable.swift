//
//  Configurable.swift
//  tipstar-ios
//
//  Created by Meng Li on 2019/05/31.
//  Copyright © 2019 XFLAG. All rights reserved.
//

import Reusable
import UIKit

public protocol Configurable: Reusable {
    
    associatedtype Model
    
    func configure(_ model: Model)
    
}

extension UITableView {

    public func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath, model: T.Model, cellType: T.Type = T.self) -> T where T: Configurable {
        let cell = dequeueReusableCell(for: indexPath, cellType: cellType)
        cell.configure(model)
        return cell
    }
    
}
