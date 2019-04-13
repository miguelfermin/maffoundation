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
    /// This version of *send(..)* user Codable to provide callers with the desired
    /// response model.
    /// ```
    /// // Here's an example on how to fetch an array of User models:
    /// let request = Request(url: url)
    /// networker.send(request) { (result: Result<[User]>) in
    ///     switch result {
    ///     case .success(let users): completion(.success(users))
    ///     case .failure(let error): completion(.failure(error))
    ///     }
    /// }
    /// ```
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
