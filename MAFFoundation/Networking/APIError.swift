//
//  APIError.swift
//  MAFFoundation
//
//  Created by Miguel Fermin on 8/2/18.
//  Copyright © 2018 MAF Software LLC. All rights reserved.
//

import Foundation

/// Represents an API error.
public struct APIError: Error {
    public let code: StatusCode
    public let text: String
    
    public let data: Data?
    public let response: URLResponse?
    public let error: Error?
    
    /// Initializes a new APIError.
    ///
    /// - Parameters:
    ///   - code: The error status code.
    ///   - text: A friendly error string.
    ///   - data: (Optional) The Data returned by the Request
    ///   - response: (Optional) The URLResponse returned by the Request.
    ///   - error: (Optional) The Error returned by the Request.
    public init(code: StatusCode, text: String? = nil, data: Data? = nil, response: URLResponse? = nil, error: Error? = nil) {
        self.code = code
        self.text = text ?? code.text
        self.data = data
        self.response = response
        self.error = error
    }
    
   init?(data: Data? = nil, response: URLResponse? = nil, error: Error? = nil) {
        if let error = error {
            let code = response?.code ?? .unknownError
            let text = error.localizedDescription
            self.init(code: code, text: text, data: data, response: response, error: error)
        }
        else if let response = response, response.isSuccessful {
            return nil
        }
        else {
            let code = response?.code ?? .unknownError
            self.init(code: code, data: data, response: response)
        }
    }
    
    var isUnauthorized: Bool {
        return code == .unauthorized
    }
}

// MARK: - Supporting Types
private extension URLResponse {
    var code: StatusCode {
        guard let code = (self as? HTTPURLResponse)?.statusCode else { return .unknownError }
        return StatusCode(rawValue: code) ?? .unknownError
    }
    var isSuccessful: Bool {
        return (200...299).contains((self as? HTTPURLResponse)?.statusCode ?? 1)
    }
}
