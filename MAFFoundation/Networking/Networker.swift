//
//  Networker.swift
//  MAFFoundation
//
//  Created by Miguel Fermin on 8/3/18.
//  Copyright © 2018 MAF Software LLC. All rights reserved.
//

import Foundation

public typealias APICompletion = (Data?, APIError?) -> Void

public protocol Networker {
    /// The default authenticator.
    /// An authenticator is responsible for getting the necessary credentials (*APIToken*)
    /// to authenticate a given Request before sending it to a server.
    var authenticator: Authenticator { get }
    
    /// Sends the specified Request to a service (API).
    /// The Request contains information of destination server.
    ///
    /// - Parameters:
    ///   - request: The Request to send.
    ///   - completion: The closure invoked upon completion.
    func send(_ request: Request, completion: @escaping APICompletion)
    
    /// Sends the specified Request to a service (API).
    /// This version of *send(..)* uses Codable to provide callers with the desired
    /// response model.
    ///
    /// - Parameters:
    ///   - request: The Request to send.
    ///   - completion: The closure invoked upon completion.
    func send<T: Decodable>(_ request: Request, completion: @escaping (Result<T, APIError>) ->Void)
    
    /// Sends the specified Request to a service (API).
    ///
    /// - Parameter request: The Request to send.
    /// - Returns: A Future that will provide the Result upon completion.
    func send<T: Decodable>(_ request: Request) -> Future<T>
}

public extension Networker {
    func send<T: Decodable>(_ request: Request) -> Future<T> {
        return Future<T> { r in self.send(request) { r($0) } }
    }
    
    func send<T: Decodable>(_ request: Request, completion: @escaping (Result<T, APIError>) ->Void) {
        send(request) { (data, error) in
            if let error = error {
                completion(.failure(error)); return
            }
            guard let data = data else {
                completion(.failure(APIError(code: .noPayload))); return
            }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let result = try decoder.decode(T.self, from: data)
                completion(.success(result))
            } catch {
                let err = APIError(code: .decodeFailed, message: "\(error.localizedDescription)", data: data, error: error)
                completion(.failure(err))
            }
        }
    }
}
