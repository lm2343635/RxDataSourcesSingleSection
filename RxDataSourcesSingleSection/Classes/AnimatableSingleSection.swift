
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
