//
//  Result.swift
//  MAFFoundation
//
//  Created by Miguel Fermin on 9/10/18.
//  Copyright © 2018 MAF Software LLC. All rights reserved.
//

import Foundation

/// Represents an API response result.
///
/// - success: The case when the request has succeeded.
///            The response model is provided as an associated type.
/// - failure: The case when request has failed.
///            The response error is provided as an associated type.
public enum Result<T> {
    case success(T)
    case failure(APIError)
    
    /// The successful result value.
    public var successValue: T? {
        switch self {
        case .success(let value): return value
        case .failure: return nil
        }
    }
}
