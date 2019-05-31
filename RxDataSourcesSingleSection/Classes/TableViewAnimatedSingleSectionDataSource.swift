
import RxDataSources

public typealias TableViewAnimatedSingleSectionDataSource<T: AnimatableModel> = RxTableViewSectionedAnimatedDataSource<AnimatableSingleSectionModel<T>>

extension TableViewAnimatedSingleSectionDataSource {
    
    public static func configure<T: UITableViewCell>(cellType: T.Type) -> TableViewAnimatedSingleSectionDataSource<T.Model> where T: Configurable {
        return TableViewAnimatedSingleSectionDataSource<T.Model>(configureCell: { (_, tableView, indexPath, model) -> UITableViewCell in
            return tableView.dequeueReusableCell(for: indexPath, model: model, cellType: cellType)
        })
    }
    
}
