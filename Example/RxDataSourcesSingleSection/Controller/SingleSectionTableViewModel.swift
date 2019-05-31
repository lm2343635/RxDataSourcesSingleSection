//
//  SingleSectionTableViewModel.swift
//  RxDataSourcesSingleSection_Example
//
//  Created by Meng Li on 2019/05/31.
//  Copyright © 2019 MuShare. All rights reserved.
//

import RxCocoa
import RxSwift
import RxDataSourcesSingleSection


class SingleSectionTableViewModel {
    
    private let persons = BehaviorRelay<[Person]>(value: (0...5).map { _ in Person.fake() })
    
    let title = Observable.just("SingleSectionTableView")
    
    var personSection: Observable<SingleSection<Person>> {
        return persons.map { SingleSection.create($0) }
    }
    
    
}
