//
//  AnimatableSingleSection.swift
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

public protocol AnimatableModel: IdentifiableType, Equatable {}

public struct AnimatableSingleSectionModel<T: AnimatableModel>: AnimatableSectionModelType {
    
    public typealias Item = T
    public typealias Identity = String
    
    public var items: [T]
    public var identity: String
    
    public init(items: [T]) {
        self.items = items
        self.identity = ""
    }
    
    public init(original: AnimatableSingleSectionModel<T>, items: [T]) {
        self = original
        self.items = items
    }
    
    public static func create(_ items: [T]) -> AnimatableSingleSection<T> {
        return [AnimatableSingleSectionModel(items: items)]
    }
    
}

public typealias AnimatableSingleSection<T: AnimatableModel> = [AnimatableSingleSectionModel<T>]

extension AnimatableSingleSection where Element: AnimatableSectionModelType, Element.Item: AnimatableModel {
    
    public static func create(_ items: [Element.Item]) -> AnimatableSingleSection<Element.Item> {
        return [AnimatableSingleSectionModel(items: items)]
    }
    
}
