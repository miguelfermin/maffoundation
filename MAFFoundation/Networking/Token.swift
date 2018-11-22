//
//  Token.swift
//  APISwift
//
//  Created by Miguel Fermin on 8/8/18.
//  Copyright © 2018 MAF Software LLC. All rights reserved.
//

import Foundation

/// Represents an API security token.
public struct Token: Codable {
    public let id: String
    public let issued: String
    public let expires: String
    public let isAdmin: Bool
}
