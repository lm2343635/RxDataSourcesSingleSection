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
        default:
            break
        }
    }
    
}
