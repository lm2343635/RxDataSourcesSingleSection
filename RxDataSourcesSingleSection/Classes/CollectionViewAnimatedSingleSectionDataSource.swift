//
//  CollectionViewAnimatedSingleSectionDataSource.swift
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

import RxDataSources

public typealias CollectionViewAnimatedSingleSectionDataSource<T: AnimatableModel>
    = RxCollectionViewSectionedAnimatedDataSource<AnimatableSingleSectionModel<T>>

extension CollectionViewAnimatedSingleSectionDataSource {
    
    public static func configure<Cell: UICollectionViewCell>(
        animationConfiguration: AnimationConfiguration = AnimationConfiguration(),
        decideViewTransition: @escaping CollectionViewAnimatedSingleSectionDataSource<Cell.Model>.DecideViewTransition = { _, _, _ in .animated },
        cellType: Cell.Type,
        configureCell: Cell.ConfigureCell? = nil,
        configureSupplementaryView: CollectionViewAnimatedSingleSectionDataSource<Cell.Model>.ConfigureSupplementaryView? = nil,
        moveItem: @escaping CollectionViewAnimatedSingleSectionDataSource<Cell.Model>.MoveItem = { _, _, _ in () },
        canMoveItemAtIndexPath: @escaping CollectionViewAnimatedSingleSectionDataSource<Cell.Model>.CanMoveItemAtIndexPath = { _, _ in false }
    ) -> CollectionViewAnimatedSingleSectionDataSource<Cell.Model> where Cell: Configurable {
        return CollectionViewAnimatedSingleSectionDataSource<Cell.Model>(
            animationConfiguration: animationConfiguration,
            decideViewTransition: decideViewTransition,
            configureCell: { _, collectionView, indexPath, model in
                let cell = collectionView.dequeueReusableCell(for: indexPath, model: model, cellType: cellType)
                configureCell?(cell, indexPath, model)
                return cell
            },
            configureSupplementaryView: configureSupplementaryView,
            moveItem: moveItem,
            canMoveItemAtIndexPath: canMoveItemAtIndexPath
        )
    }
    
}
