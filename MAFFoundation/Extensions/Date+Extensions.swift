//
//  Date+Extensions.swift
//  MAFFoundation
//
//  Created by Miguel Fermin on 11/24/18.
//  Copyright © 2018 MAF Software LLC. All rights reserved.
//

import Foundation

public extension Date {
    var timeString: String {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter.string(from: self)
    }
    
    var shortString: String {
        let formatter = dateFormatter()
        return formatter.string(from: self)
    }
    
    var mediumString: String {
        let formatter = dateFormatter(style: .medium)
        return formatter.string(from: self)
    }
    
    var longString: String {
        let formatter = dateFormatter(style: .long)
        return formatter.string(from: self)
    }
    
    var fullString: String {
        let formatter = dateFormatter(style: .full)
        return formatter.string(from: self)
    }
    
    private func dateFormatter(style: DateFormatter.Style = .short) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateStyle = style
        return formatter
    }
}
