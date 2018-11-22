//
//  Response.swift
//  MAFFoundation
//
//  Created by Miguel Fermin on 8/9/18.
//  Copyright © 2018 MAF Software LLC. All rights reserved.
//

import Foundation

/// Represents an API general-purpose response to use when no specific response model is used.
public struct Response: Decodable {
    /// The response message.
    public let message: String
}
