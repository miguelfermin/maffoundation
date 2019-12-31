//
//  NetworkerDefault.swift
//  MAFFoundation
//
//  Created by Miguel Fermin on 9/11/18.
//  Copyright © 2018 MAF Software LLC. All rights reserved.
//

import Foundation

/// The default *Networker*.
public struct NetworkerDefault: Networker {
    public let authenticator: Authenticator
    private let session: URLSession
    
    /// Initializes a NetworkerDefault with its Authenticator.
    /// - Parameter authenticator: The default authenticator.
    /// - Parameter timeout: The request timeout interval for all tasks. The default value is 60 seconds.
    public init(authenticator: Authenticator, timeout: TimeInterval = 60 ) {
        self.authenticator = authenticator
        self.session = URLSessionProvider.shared.session
        session.configuration.timeoutIntervalForRequest = timeout
    }
}

// MARK: - API
extension NetworkerDefault {
    public func send(_ request: Request, completion: @escaping APICompletion) {
        if let urlRequest = request.customHeadersUrlRequest {
            send(urlRequest, method: request.httpMethod, completion: completion)
            return
        }
        authenticator.httpHeaders { headers in
            guard let headers = headers else {
                self.handle(data: nil, error: APIError(code: .unauthorized), completion: completion)
                return
            }
            let urlRequest = request.urlRequest(headers: headers)
            self.send(urlRequest, method: request.httpMethod, completion: completion)
        }
    }
}

// MARK: - Internal
extension NetworkerDefault {
    func send(_ request: URLRequest, method: HttpMethod, completion: @escaping APICompletion) {
        if method == .get {
            download(request: request, completion: completion)
            return
        }
        guard let data = method.data else {
            let message = "Data encoding error. Caught at client side"
            completion(nil, APIError(code: .badRequest, message: message))
            return
        }
        upload(request: request, data: data, completion: completion)
    }
    
    func upload(request: URLRequest, data: Data, completion: @escaping APICompletion) {
        session.uploadTask(with: request, from: data) { (data, response, error) in
            self.handle(data: data, response: response, error: error, completion: completion)
        }.resume()
    }
    
    func download(request: URLRequest, completion: @escaping APICompletion) {
        session.dataTask(with: request){ (data, response, error) in
            self.handle(data: data, response: response, error: error, completion: completion)
        }.resume()
    }
}

extension NetworkerDefault {
    func handle(data: Data?, response: URLResponse?, error: Error?, completion: @escaping APICompletion) {
        if let error = APIError(data: data, response: response, error: error) {
            handle(data: data, error: error, completion: completion)
        } else if let data = data {
            handle(data: data, error: nil, completion: completion)
        } else {
            handle(data: nil, error: APIError(code: .noPayload), completion: completion)
        }
    }
    
    func handle(data: Data?, error: APIError?, completion: @escaping APICompletion) {
        DispatchQueue.main.async {
            if let error = error, error.isUnauthorized {
                NotificationCenter.default.post(name: Notifications.authRequired, object: nil)
            }
            completion(data, error)
        }
    }
}
