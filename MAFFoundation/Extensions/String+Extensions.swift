//
//  String+Extensions.swift
//  MAFFoundation
//
//  Created by Miguel Fermin on 1/3/19.
//  Copyright © 2019 MAF Software LLC. All rights reserved.
//

import Foundation

// MARK: - Phone number formatting

/// Phone number patterns per country.
/// Using ISO 3166-1 alpha-3 for countries.
public enum PhonePattern: String {
    case usa = "(###) ###-####"
    case can = "###-###-####"
    case mex = "####-####"
    case arg = "(###) ####-####"
    case gbr = "#### ### ####"
    
    static var char: Character { return "#" }
    
    public var count: Int { return rawValue.count }
    
    /// The number count, excluding separators.
    public var numCount: Int {
        return rawValue
            .replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
            .replacingOccurrences(of: "-", with: "")
            .replacingOccurrences(of: " ", with: "")
            .count
    }
}

extension String {
    /// Applies the specified phone number pattern to Self and returns it as a new string.
    /// - Parameter pattern: The *PhonePattern* to apply.
    /// - Returns: A new String formatted per the specified *pattern*.
    public func applyPhonePattern(_ pattern: PhonePattern) -> String {
        var num = replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)
        for idx in 0 ..< pattern.count {
            guard idx < num.count else { return num }
            let stringIndex = String.Index(encodedOffset: idx)
            let patternCharacter = pattern.rawValue[stringIndex]
            guard patternCharacter != PhonePattern.char else { continue }
            num.insert(patternCharacter, at: stringIndex)
        }
        return num
    }
}

// MARK: -  ...
