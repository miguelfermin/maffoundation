//
//  Authenticator.swift
//  MAFFoundation
//
//  Created by Miguel Fermin on 9/10/18.
//  Copyright © 2018 MAF Software LLC. All rights reserved.
//

import Foundation

/// API authorization headers.
public typealias ApiHeaders = [String : String]

/// Authenticator is responsible for getting the necessary authorization headers
/// to authenticate a given **Request** before sending it to a server.
public protocol Authenticator {
    /// Gets authorization headers and provides it in the completion handler/
    /// - Parameter completion: The closure invoked upon completion.
    func getApiHeaders(completion: @escaping (ApiHeaders?) -> Void)
}
