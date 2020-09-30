//
//  Enum.swift
//  ShaadiDemoApp
//
//  Created by MacMini 20 on 9/28/20.
//

// MARK:- Enum for API path it contains description string to set associated value to enum if need
enum APIPath : CustomStringConvertible {
    case FetchAllUsers

    var description : String {
        switch self {
        case .FetchAllUsers: return "https://jsonplaceholder.typicode.com/users"
        }
    }
}

// MARK:- Alert Message Enum
enum Messages: String {
    case Fail
    case Ok
    case Error
    case Success
}

//MARK:- Cell Identifiers for tableview and collection view
enum CellIdentifier: String {
    case UserInfoTableViewCell
}

//MARK:- API error code.
enum RequestError: Error {
    case clientError
    case serverError
    case noData
    case dataDecodingError
}
