//
//  NetworkManager.swift
//  News MVVM
//
//  Created by Burak Kubat on 2.04.2023.
//

import Foundation



enum ErrorTypes: Error {
    case serverError
    case badServerResponse
    case noData
}

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    func getData(url: URL, completion: @escaping (Result<Data, ErrorTypes>) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                completion(.failure(.serverError))
                return
            }
            guard let response = response as? HTTPURLResponse,
                response.statusCode == 200 else {
                completion(.failure(.badServerResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            completion(.success(data))
        } .resume()
        }
}
