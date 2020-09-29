//
//  UserViewModel.swift
//  ShaadiDemoApp
//
//  Created by MacMini 20 on 9/28/20.
//


/*
 Name
 Phone & Website
 Company Name
 Star
 
 Name
 Username
 Address details
 Company Detail
 Phone & Website
 Star (a call to action OR a button where it can be marked as Favourite)
 
 Street Number Street Name, Suite Number
 City Name, State Zip code
 */
import Foundation

class UserViewModel {
    
    weak var dataSource : GenericDataSource<UserDetailViewModel>?
    
    init(dataSource : GenericDataSource<UserDetailViewModel>?) {
        self.dataSource = dataSource
    }
    
    func fetchAllUsers(completion: ((_ err: Error?) -> ())? = nil) {
        NetworkHelper<[UserDataModel]>.APICall(APIPath.FetchAllUsers.description) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .failure(let err):
                completion?(err)
            case .success(let allUserData):
                completion?(nil)
                strongSelf.dataSource?.data.value = allUserData.map{UserDetailViewModel(model: $0)}
            }
        }
    }
}
