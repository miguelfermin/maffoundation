//
//  Encodable+Extensions.swift
//  MAFFoundation
//
//  Created by Miguel Fermin on 11/26/18.
//  Copyright © 2018 MAF Software LLC. All rights reserved.
//

import Foundation

public extension Encodable {
    var encoded: Data? {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        return try? encoder.encode(self)
    }
}
