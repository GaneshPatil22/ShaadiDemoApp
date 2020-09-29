//
//  Enum.swift
//  ShaadiDemoApp
//
//  Created by MacMini 20 on 9/28/20.
//


enum APIPath : CustomStringConvertible {
    case FetchAllUsers
    
    var description : String {
        switch self {
        case .FetchAllUsers: return "https://jsonplaceholder.typicode.com/users"
        }
    }
}

enum Messages: String {
    case Fail
    case Ok
    case Error
    case Success
}

enum CellIdentifier: String {
    case UserInfoTableViewCell
}

enum RequestError: Error {
    case clientError
    case serverError
    case noData
    case dataDecodingError
}
