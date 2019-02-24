//
//  Localizable.swift
//  MAFFoundation
//
//  Created by Miguel Fermin on 2/24/19.
//  Copyright © 2019 MAF Software LLC. All rights reserved.
//

import Foundation

/// Returns a localized string.
func Localized(_ key: String, comment: String = "") -> String {
    let bundle = Bundle(identifier: "com.mafsoftware.MAFFoundation")!
    return NSLocalizedString(key, bundle: bundle, comment: comment)
}
