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
    public let message: String
    public let info: Any?
    
    public let data: Data?
    public let response: URLResponse?
    public let error: Error?
    
    /// Initializes a new APIError.
    ///
    /// - Parameters:
    ///   - code: The error status code.
    ///   - message: The error message.
    ///   - data: (Optional) The Data returned by the Request
    ///   - response: (Optional) The URLResponse returned by the Request.
    ///   - error: (Optional) The Error returned by the Request.
    ///   - info: (Optional) A Dictionary containing additional information about the error.
    public init(code: StatusCode, message: String? = nil, data: Data? = nil, response: URLResponse? = nil, error: Error? = nil, info: Any? = nil) {
        self.code = code
        self.message = message ?? code.text
        self.data = data
        self.response = response
        self.error = error
        self.info = info
    }
    
    init?(data: Data? = nil, response: URLResponse? = nil, error: Error? = nil) {
        if let res = response, res.isSuccessful {
            return nil
        }
        
        if error != nil {
            let code = response?.code ?? .unknown
            let text = error!.localizedDescription
            self.init(code: code, message: text, data: data, response: response, error: error!)
            return
        }
        
        guard let json = data?.json, let message = json["message"] as? String else {
            let code = response?.code ?? .unknown
            self.init(code: code, data: data, response: response)
            return
        }
        
        self.init(
            code: response?.code ?? .unknown,
            message: message,
            data: data,
            response: response,
            info: json["info"]
        )
    }
    
    var isUnauthorized: Bool {
        return code == .unauthorized
    }
}

// MARK: - Supporting Types
private extension URLResponse {
    var code: StatusCode {
        guard let code = (self as? HTTPURLResponse)?.statusCode else { return .unknown }
        return StatusCode(rawValue: code) ?? .unknown
    }
    var isSuccessful: Bool {
        return (200...299).contains((self as? HTTPURLResponse)?.statusCode ?? 1)
    }
}

