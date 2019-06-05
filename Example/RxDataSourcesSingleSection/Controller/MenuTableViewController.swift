//
//  ViewController.swift
//  RxDataSourcesSingleSection
//
//  Created by Meng Li on 2019/05/31.
//  Copyright © 2019 MuShare. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let singleSectionTableViewController = SingleSectionTableViewController(viewModel: .init())
            navigationController?.pushViewController(singleSectionTableViewController, animated: true)
        case 1:
            let animatableSingleSectionTableViewController = AnimatableSingleSectionTableViewController(viewModel: .init())
            navigationController?.pushViewController(animatableSingleSectionTableViewController, animated: true)
        case 2:
            let multiCellTypeSingleSectionTableViewController = MultiCellTypeSingleSectionTableViewController(viewModel: .init())
            navigationController?.pushViewController(multiCellTypeSingleSectionTableViewController, animated: true)
        default:
            break
        }
    }
    
}
