//
//  UserDetailViewModel.swift
//  ShaadiDemoApp
//
//  Created by MacMini 20 on 9/30/20.
//

import Foundation

class UserDetailViewModel {

    let userData: UserDataModel
    var isUserMarkedAsFavorite = false

    init(model: UserDataModel) {
        self.userData = model
    }

    var companyName: String {
        userData.company.name
    }
    var userFullAddress: String {
        "\(userData.address.street), \(userData.address.suite) \n\(userData.address.city), \(userData.address.zipcode)"
    }
    var compnayAddress: String {
        "\(userData.company.name)\n\(userData.company.catchPhrase)\n\(userData.company.bs)"
    }

    /**
     Update the favorite status of user and marked this method as discardableResult so that method will not complain about its return result
     - Parameters:NA
     - Returns: Message string according to user favorite status.
     */
    @discardableResult
    func updateUserFavoriteStatus() -> String {
        self.isUserMarkedAsFavorite = !self.isUserMarkedAsFavorite
        let message = isUserMarkedAsFavorite ? "User marked as Favorite" : "User removed from your Favorite list"
        return message
    }
}
