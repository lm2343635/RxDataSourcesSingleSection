
import RxDataSources

protocol AnimatableModel: IdentifiableType, Equatable {}

struct AnimatableSingleSectionModel<T: AnimatableModel>: AnimatableSectionModelType {
    
    typealias Item = T
    typealias Identity = String
    
    var items: [T]
    var identity: String
    
    init(items: [T]) {
        self.items = items
        self.identity = ""
    }
    
    init(original: AnimatableSingleSectionModel<T>, items: [T]) {
        self = original
        self.items = items
    }
    
    static func create(_ items: [T]) -> AnimatableSingleSection<T> {
        return [AnimatableSingleSectionModel(items: items)]
    }
    
}

typealias AnimatableSingleSection<T: AnimatableModel> = [AnimatableSingleSectionModel<T>]

extension AnimatableSingleSection where Element: AnimatableSectionModelType, Element.Item: AnimatableModel {
    static func create(_ items: [Element.Item]) -> AnimatableSingleSection<Element.Item> {
        return [AnimatableSingleSectionModel(items: items)]
    }
}
