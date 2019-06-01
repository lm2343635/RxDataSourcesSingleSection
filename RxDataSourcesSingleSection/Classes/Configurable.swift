//
//  Configurable.swift
//  RxDataSourcesSingleSection
//
//  Created by Meng Li on 2019/05/31.
//  Copyright © 2019 MuShare. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

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

extension UICollectionView {
    
    public func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath, model: T.Model, cellType: T.Type = T.self) -> T where T: Configurable {
        let cell = dequeueReusableCell(for: indexPath, cellType: cellType)
        cell.configure(model)
        return cell
    }
    
}
