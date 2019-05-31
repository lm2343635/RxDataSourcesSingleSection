
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
