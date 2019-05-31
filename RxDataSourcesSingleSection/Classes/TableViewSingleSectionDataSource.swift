
import RxDataSources

public typealias TableViewSingleSectionDataSource<T> = RxTableViewSectionedReloadDataSource<SingleSectionModel<T>>

extension TableViewSingleSectionDataSource {
    
    public static func configure<T: UITableViewCell>(cellType: T.Type) -> TableViewSingleSectionDataSource<T.Model> where T: Configurable {
        return TableViewSingleSectionDataSource<T.Model>(configureCell: { (_, tableView, indexPath, model) -> UITableViewCell in
            return tableView.dequeueReusableCell(for: indexPath, model: model, cellType: cellType)
        })
    }
    
}
