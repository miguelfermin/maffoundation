//
//  DefaultNetworker.swift
//  MAFFoundation
//
//  Created by Miguel Fermin on 9/11/18.
//  Copyright © 2018 MAF Software LLC. All rights reserved.
//

import Foundation

/// The default *Networker*.
public struct DefaultNetworker: Networker {
    public let authenticator: Authenticator
    
    /// Initializes a DefaultNetworker with its Authenticator.
    ///
    /// - Parameter authenticator: The default authenticator.
    public init(authenticator: Authenticator) {
        self.authenticator = authenticator
    }
}

// MARK: - API
public extension DefaultNetworker {
    
    func send(_ request: Request, completion: @escaping APICompletion) {
        if let urlRequest = request.customHeadersUrlRequest {
            send(urlRequest, method: request.httpMethod, completion: completion)
            return
        }
        
        authenticator.getApiHeaders { headers in
            guard let headers = headers else {
                let error = APIError(code: .unauthorized)
                self.handle(data: nil, error: error, completion: completion)
                return
            }
            
            let urlRequest = request.urlRequest(headers: headers)
            self.send(urlRequest, method: request.httpMethod, completion: completion)
        }
    }
    
    func send<T: Decodable>(_ request: Request, completion: @escaping (Result<T, APIError>) ->Void) {
        send(request) { (data, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(APIError(code: .noPayload)))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let result = try decoder.decode(T.self, from: data)
                completion(.success(result))
            } catch {
                let err = APIError(code: .decodeFailed, message: "\(error.localizedDescription)", data: data, error: error)
                completion(.failure(err))
            }
        }
    }
    
    func send<T: Decodable>(_ request: Request) -> Future<T> {
        return Future<T> { r in self.send(request) { r($0) } }
    }
}

// MARK: - Internal
extension DefaultNetworker {
    
    func send(_ request: URLRequest, method: HttpMethod, completion: @escaping APICompletion) {
        if let data = method.data, method != .get {
            upload(request: request, data: data, completion: completion)
        } else {
            download(request: request, completion: completion)
        }
    }
    
    func upload(request: URLRequest, data: Data, completion: @escaping APICompletion) {
        let session = URLSessionProvider.shared.session
        session.uploadTask(with: request, from: data) { (data, response, error) in
            self.handle(data: data, response: response, error: error, completion: completion)
            }.resume()
    }
    
    func download(request: URLRequest, completion: @escaping APICompletion) {
        let session = URLSessionProvider.shared.session
        session.dataTask(with: request){ (data, response, error) in
            self.handle(data: data, response: response, error: error, completion: completion)
            }.resume()
    }
    
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
