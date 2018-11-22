//
//  URLSessionProvider.swift
//  MAFFoundation
//
//  Created by Miguel Fermin on 8/6/18.
//  Copyright © 2018 MAF Software LLC. All rights reserved.
//

import Foundation

/// Single URLSession to use for the lifecycle of the program.
class URLSessionProvider {
    let sessionId: String
    let session: URLSession
    
    static let shared: URLSessionProvider = {
        return URLSessionProvider()
    }()
    
    private init() {
        sessionId = UUID().uuidString
        session = URLSession(configuration: URLSessionConfiguration.default)
    }
}
