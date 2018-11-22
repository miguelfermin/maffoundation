//
//  HttpMethod.swift
//  APISwift
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
public enum HttpMethod: Equatable {
    case get
    case post(Data)
    case put(Data)
    case patch(Data)
    case delete(Data)
    
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
            return data
        }
    }
}
