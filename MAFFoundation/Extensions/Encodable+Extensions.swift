//
//  Encodable+Extensions.swift
//  MAFFoundation
//
//  Created by Miguel Fermin on 11/26/18.
//  Copyright © 2018 MAF Software LLC. All rights reserved.
//

import Foundation

public extension Encodable {
    var encoded: Data? { return try? JSONEncoder().encode(self) }
}
