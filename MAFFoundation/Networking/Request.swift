//
//  Request.swift
//  MAFFoundation
//
//  Created by Miguel Fermin on 8/6/18.
//  Copyright © 2018 MAF Software LLC. All rights reserved.
//

import Foundation

/// Represents a Request being sent to a HTTP server.
/// The Request contains information of destination server.
public struct Request {
    let url: URL
    let httpMethod: HttpMethod
    var headers: [String: String]?
    
    /// Initializes a new Request with all information required to be sent.
    ///
    /// - Parameters:
    ///   - url: The destination URL.
    ///   - httpMethod: The HTTP method to use.
    ///   - headers: (Optional) Custom HTTP headers to use on this request.
    ///     If provided, default authentication is skipped.
    public init(url: URL, httpMethod: HttpMethod = .get, headers: [String: String]? = nil) {
        self.url = url
        self.httpMethod = httpMethod
        self.headers = headers
    }
    
    var customHeadersUrlRequest: URLRequest? {
        guard let headers = headers else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.string
        request.allHTTPHeaderFields = headers
        printCurl(request)
        return request
    }
    
    func urlRequest(headers: [String : String]) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.string
        request.allHTTPHeaderFields = headers
        printCurl(request)
        return request
    }
    
    func printCurl(_ request: URLRequest) {
        #if DEBUG
        guard let url = request.url?.absoluteString, let method = request.httpMethod else {
            print("Request doesn't have URL nor HTTP Method to print cUrl")
            return
        }
        
        var curl = "curl -X \(method) \\\n"
        curl.append("\(url) \\\n")
        
        if let headers = request.allHTTPHeaderFields {
            for (key, val) in headers {
                curl.append("-H '\(key): \(val)' \\\n")
            }
        }
        
        if let data = httpMethod.data {
            guard let dict = try? JSONSerialization.jsonObject(with: data, options: []),
                let logData = try? JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted),
                let body = String(data: logData, encoding: .utf8) else {
                    if let body = try? JSONSerialization.jsonObject(with: data, options: []) {
                        curl.append("-d '\(body)'")
                    }
                    print(curl)
                    return
            }
            curl.append("-d '\(body)'")
        }
        print(curl)
        #endif
    }
}
