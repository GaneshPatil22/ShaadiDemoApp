//
//  UserDataSource.swift
//  ShaadiDemoApp
//
//  Created by MacMini 20 on 9/30/20.
//

import UIKit

class UserDataSource : GenericDataSource<UserDetailViewModel>, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.UserInfoTableViewCell.rawValue, for: indexPath) as! UserInfoTableViewCell
        let model = self.data.value[indexPath.row]
        cell.setUpData(viewModel: model)
        return cell
    }
}
