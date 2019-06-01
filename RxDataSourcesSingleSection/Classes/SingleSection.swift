//
//  SingleSection.swift
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

// SectionedReloadDataSource
public struct SingleSectionModel<T>: SectionModelType {
    
    public typealias Item = T
    
    public var items: [T]
    
    init(items: [T]) {
        self.items = items
    }
    
    public init(original: SingleSectionModel<T>, items: [T]) {
        self = original
    }
    
    public static func create(_ items: [T]) -> SingleSection<T> {
        return [SingleSectionModel(items: items)]
    }
    
}

public typealias SingleSection<T> = [SingleSectionModel<T>]

extension SingleSection where Element: SectionModelType {
    
    public static func create(_ items: [Element.Item]) -> SingleSection<Element.Item> {
        return [SingleSectionModel(items: items)]
    }
    
}
