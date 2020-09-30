//
//  NetworkHelper.swift
//  ShaadiDemoApp
//
//  Created by MacMini 20 on 9/28/20.
//

import Foundation

class NetworkHelper<T: Codable> {

    /**
     Make an API call using URL session
     - Parameters:
     - _ : API path.
     - method: method type for API call default would be get
     - resultHandler: Completion handler that takes result as a argument and returns void
     - Returns: NA
     */
    static func APICall(_ apiUrl : String,
                        method: String = "GET",
                        resultHandler : @escaping((Result<T, RequestError>) -> Void)) {

        let url = URL(string: apiUrl)!
        let urlTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                resultHandler(.failure(.clientError))
                return
            }

            guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                resultHandler(.failure(.serverError))
                return
            }

            guard let data = data else {
                resultHandler(.failure(.noData))
                return
            }

            guard let decodedData: T = ResponseHelper<T>().decodedData(data) else {
                resultHandler(.failure(.dataDecodingError))
                return
            }
            resultHandler(.success(decodedData))
        }
        urlTask.resume()
    }
}

class ResponseHelper<T: Codable> {
    func decodedData(_ data: Data) -> T? {
        try? JSONDecoder().decode(T.self, from: data)
    }
}
