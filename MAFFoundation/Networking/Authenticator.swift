//
//  Authenticator.swift
//  APISwift
//
//  Created by Miguel Fermin on 9/10/18.
//  Copyright © 2018 MAF Software LLC. All rights reserved.
//

import Foundation

/// Authenticator is responsible for getting the necessary credentials (*APIToken*)
/// to authenticate a given **Request** before sending it to a server.
public protocol Authenticator {
    /// Gets APIToken and provides it in the completion handler, if obtained.
    ///
    /// - Parameter completion: The closure invoked upon completion.
    func getAPIToken(completion: @escaping (Token?) -> Void)
}
