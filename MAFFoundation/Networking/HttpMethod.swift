//
//  HttpMethod.swift
//  MAFFoundation
//
//  Created by Miguel Fermin on 8/6/18.
//  Copyright © 2018 MAF Software LLC. All rights reserved.
//

import Foundation

/// Represents an HTTP method.
/// Encapsulaes (as associated values) the data being sent, *except for GET*.
///
/// - get: An HTTP GET method.
/// - post: An HTTP POST method.
/// - put: An HTTP PUT method.
/// - patch: An HTTP PATCH method.
/// - delete: An HTTP DELETE method.
public enum HttpMethod {
    case get
    case post(Encodable)
    case put(Encodable)
    case patch(Encodable)
    case delete(Encodable)
    
    var string: String {
        switch self {
        case .get:       return "GET"
        case .post(_):   return "POST"
        case .put(_):    return "PUT"
        case .patch(_):  return "PATCH"
        case .delete(_): return "DELETE"
        }
    }
    
    var data: Data? {
        switch self {
        case .get:
            return nil
        case .post(let data), .put(let data), .patch(let data), .delete(let data):
            // Since Data conforms to Encodable, avoid double encoding.
            if data is Data { return data as? Data }
            return data.encoded
        }
    }
}

extension HttpMethod: Equatable {
    public static func == (lhs: HttpMethod, rhs: HttpMethod) -> Bool {
        switch (lhs, rhs) {
        case (.get, .get):
            return true
        case (let .post(left), let .post(right)):
            return left.encoded == right.encoded
        case (let .put(left), let .put(right)):
            return left.encoded == right.encoded
        case (let .patch(left), let .patch(right)):
            return left.encoded == right.encoded
        case (let .delete(left), let .delete(right)):
            return left.encoded == right.encoded
        default:
            return false
        }
    }
}
