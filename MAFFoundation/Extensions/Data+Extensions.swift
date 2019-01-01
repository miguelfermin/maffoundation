//
//  Data+Extensions.swift
//  MAFFoundation
//
//  Created by Miguel Fermin on 1/1/19.
//  Copyright © 2019 MAF Software LLC. All rights reserved.
//

import Foundation

public extension Data {
    /// Returns a Foundation object from given JSON data.
    var json: [String: Any]? {
        return (try? JSONSerialization.jsonObject(with: self, options: []) ) as? [String: Any]
    }
}
