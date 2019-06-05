//
//  MultiCellTypeSingleSectionTableViewModel.swift
//  RxDataSourcesSingleSection_Example
//
//  Created by Meng Li on 2019/06/05.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import RxCocoa
import RxSwift
import RxDataSourcesSingleSection

enum MultiModel {
    case person(Person)
    case company(Company)
}

class MultiCellTypeSingleSectionTableViewModel {
    
    private let infos = BehaviorRelay<[MultiModel]>(value: [
        .company(.fake()), .person(.fake()), .person(.fake()), .person(.fake()),
        .company(.fake()), .person(.fake()), .person(.fake()),
        .company(.fake()), .person(.fake()),
    ])
    
    let title = Observable.just("MultiCellTypeSingleSectionTableView")
    
    var infoSection: Observable<SingleSection<MultiModel>> {
        return infos.map { SingleSection.create($0) }
    }
    
}
