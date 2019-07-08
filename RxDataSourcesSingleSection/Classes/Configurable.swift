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
import RxDataSources
import UIKit

public protocol Configurable: Reusable {
    
    typealias ConfigureCell = (Self, IndexPath, Model) -> Void
    
    associatedtype Model
    
    func configure(_ model: Model)
    
}

extension Configurable where Self: UITableViewCell {

    public static func tableViewSingleSectionDataSource(
        configureCell: ConfigureCell? = nil,
        titleForHeaderInSection: @escaping TableViewSingleSectionDataSource<Model>.TitleForFooterInSection = { _, _ in nil },
        titleForFooterInSection: @escaping TableViewSingleSectionDataSource<Model>.TitleForFooterInSection = { _, _ in nil },
        canEditRowAtIndexPath: @escaping TableViewSingleSectionDataSource<Model>.CanEditRowAtIndexPath = { _, _ in false },
        canMoveRowAtIndexPath: @escaping TableViewSingleSectionDataSource<Model>.CanMoveRowAtIndexPath = { _, _ in false },
        sectionIndexTitles: @escaping TableViewSingleSectionDataSource<Model>.SectionIndexTitles = { _ in nil },
        sectionForSectionIndexTitle: @escaping TableViewSingleSectionDataSource<Model>.SectionForSectionIndexTitle = { _, _, index in index }
    ) -> TableViewSingleSectionDataSource<Model> {
        return TableViewSingleSectionDataSource<Model>.configure(
            cellType: self,
            configureCell: configureCell,
            titleForHeaderInSection: titleForFooterInSection,
            titleForFooterInSection: titleForFooterInSection,
            canEditRowAtIndexPath: canEditRowAtIndexPath,
            canMoveRowAtIndexPath: canMoveRowAtIndexPath,
            sectionIndexTitles: sectionIndexTitles,
            sectionForSectionIndexTitle: sectionForSectionIndexTitle
        )
    }
    
}

extension Configurable where Self: UITableViewCell, Model: AnimatableModel {
    
    public static func tableViewAnimatedSingleSectionDataSource(
        animationConfiguration: AnimationConfiguration = AnimationConfiguration(),
        decideViewTransition: @escaping TableViewAnimatedSingleSectionDataSource<Model>.DecideViewTransition = { _, _, _ in .animated },
        configureCell: ConfigureCell? = nil,
        titleForHeaderInSection: @escaping TableViewAnimatedSingleSectionDataSource<Model>.TitleForFooterInSection = { _, _ in nil },
        titleForFooterInSection: @escaping TableViewAnimatedSingleSectionDataSource<Model>.TitleForFooterInSection = { _, _ in nil },
        canEditRowAtIndexPath: @escaping TableViewAnimatedSingleSectionDataSource<Model>.CanEditRowAtIndexPath = { _, _ in false },
        canMoveRowAtIndexPath: @escaping TableViewAnimatedSingleSectionDataSource<Model>.CanMoveRowAtIndexPath = { _, _ in false },
        sectionIndexTitles: @escaping TableViewAnimatedSingleSectionDataSource<Model>.SectionIndexTitles = { _ in nil },
        sectionForSectionIndexTitle: @escaping TableViewAnimatedSingleSectionDataSource<Model>.SectionForSectionIndexTitle = { _, _, index in index }
    ) -> TableViewAnimatedSingleSectionDataSource<Model> {
        return TableViewAnimatedSingleSectionDataSource<Model>.configure(
            animationConfiguration: animationConfiguration,
            decideViewTransition: decideViewTransition,
            cellType: self,
            configureCell: configureCell,
            titleForHeaderInSection: titleForFooterInSection,
            titleForFooterInSection: titleForFooterInSection,
            canEditRowAtIndexPath: canEditRowAtIndexPath,
            canMoveRowAtIndexPath: canMoveRowAtIndexPath,
            sectionIndexTitles: sectionIndexTitles,
            sectionForSectionIndexTitle: sectionForSectionIndexTitle
        )
    }

}

extension Configurable where Self: UICollectionViewCell {
    
    public static func collectionViewSingleSectionDataSource(
        configureCell: ConfigureCell? = nil,
        configureSupplementaryView: CollectionViewSingleSectionDataSource<Model>.ConfigureSupplementaryView? = nil,
        moveItem: @escaping CollectionViewSingleSectionDataSource<Model>.MoveItem = { _, _, _ in () },
        canMoveItemAtIndexPath: @escaping CollectionViewSingleSectionDataSource<Model>.CanMoveItemAtIndexPath = { _, _ in false }
    ) -> CollectionViewSingleSectionDataSource<Model> {
        return CollectionViewSingleSectionDataSource<Model>.configure(
            cellType: self,
            configureCell: configureCell,
            configureSupplementaryView: configureSupplementaryView,
            moveItem: moveItem,
            canMoveItemAtIndexPath: canMoveItemAtIndexPath
        )
    }
    
}

extension Configurable where Self: UICollectionViewCell, Model: AnimatableModel {
    
    public static func collectionViewAnimatedSingleSectionDataSource(
        animationConfiguration: AnimationConfiguration = AnimationConfiguration(),
        decideViewTransition: @escaping CollectionViewAnimatedSingleSectionDataSource<Model>.DecideViewTransition = { _, _, _ in .animated },
        configureCell: ConfigureCell? = nil,
        configureSupplementaryView: CollectionViewAnimatedSingleSectionDataSource<Model>.ConfigureSupplementaryView? = nil,
        moveItem: @escaping CollectionViewAnimatedSingleSectionDataSource<Model>.MoveItem = { _, _, _ in () },
        canMoveItemAtIndexPath: @escaping CollectionViewAnimatedSingleSectionDataSource<Model>.CanMoveItemAtIndexPath = { _, _ in false }
    ) -> CollectionViewAnimatedSingleSectionDataSource<Model> {
        return CollectionViewAnimatedSingleSectionDataSource<Model>.configure(
            animationConfiguration: animationConfiguration,
            decideViewTransition: decideViewTransition,
            cellType: self,
            configureCell: configureCell,
            configureSupplementaryView: configureSupplementaryView,
            moveItem: moveItem,
            canMoveItemAtIndexPath: canMoveItemAtIndexPath
        )
    }
    
}

extension UITableView {

    public func dequeueReusableCell<Cell: UITableViewCell>(for indexPath: IndexPath, model: Cell.Model, cellType: Cell.Type = Cell.self)
        -> Cell where Cell: Configurable {
        let cell = dequeueReusableCell(for: indexPath, cellType: cellType)
        cell.configure(model)
        return cell
    }
    
}

extension UICollectionView {
    
    public func dequeueReusableCell<Cell: UICollectionViewCell>(for indexPath: IndexPath, model: Cell.Model, cellType: Cell.Type = Cell.self)
        -> Cell where Cell: Configurable {
        let cell = dequeueReusableCell(for: indexPath, cellType: cellType)
        cell.configure(model)
        return cell
    }
    
}
