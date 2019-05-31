//
//  AnimatableSingleSectionTableViewModel.swift
//  RxDataSourcesSingleSection_Example
//
//  Created by Meng Li on 2019/05/31.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import RxCocoa
import RxSwift
import RxDataSourcesSingleSection

class AnimatableSingleSectionTableViewModel {
    
    private let persons = BehaviorRelay<[Person]>(value: (0...5).map { _ in Person.fake() })
    
    let title = Observable.just("AnimatableSingleSectionTableView")
    
    var personSection: Observable<AnimatableSingleSection<Person>> {
        return persons.map { AnimatableSingleSection.create($0) }
    }
    
    func add() {
        var newPersons = persons.value
        newPersons.append(Person.fake())
        persons.accept(newPersons)
    }
    
}
