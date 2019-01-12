//
//  StatusCode.swift
//  MAFFoundation
//
//  Created by Miguel Fermin on 8/6/18.
//  Copyright © 2018 MAF Software LLC. All rights reserved.
//

import Foundation

/// Representd an HTTP status code.
public enum StatusCode: Int {
    /// RFC 7231, 6.2.1
    case `continue`         = 100
    /// RFC 7231, 6.2.2
    case switchingProtocols = 101
    /// RFC 2518, 10.1
    case processing         = 102
    
    /// RFC 7231, 6.3.1
    case ok                   = 200
    /// RFC 7231, 6.3.2
    case created              = 201
    /// RFC 7231, 6.3.3
    case accepted             = 202
    /// RFC 7231, 6.3.4
    case nonAuthoritativeInfo = 203
    /// RFC 7231, 6.3.5
    case noContent            = 204
    /// RFC 7231, 6.3.6
    case resetContent         = 205
    /// RFC 7233, 4.1
    case partialContent       = 206
    /// RFC 4918, 11.1
    case multiStatus          = 207
    /// RFC 5842, 7.1
    case alreadyReported      = 208
    /// RFC 3229, 10.4.1
    case IMUsed               = 226
    
    /// RFC 7231, 6.4.1
    case multipleChoices  = 300
    /// RFC 7231, 6.4.2
    case movedPermanently = 301
    /// RFC 7231, 6.4.3
    case found            = 302
    /// RFC 7231, 6.4.4
    case seeOther         = 303
    /// RFC 7232, 4.1
    case notModified      = 304
    /// RFC 7231, 6.4.5
    case useProxy         = 305
    /// RFC 7231, 6.4.7
    case temporaryRedirect = 307
    /// RFC 7538, 3
    case permanentRedirect = 308
    
    /// RFC 7231, 6.5.1
    case badRequest                   = 400
    /// RFC 7235, 3.1
    case unauthorized                 = 401
    /// RFC 7231, 6.5.2
    case paymentRequired              = 402
    /// RFC 7231, 6.5.3
    case forbidden                    = 403
    /// RFC 7231, 6.5.4
    case notFound                     = 404
    /// RFC 7231, 6.5.5
    case methodNotAllowed             = 405
    /// RFC 7231, 6.5.6
    case notAcceptable                = 406
    /// RFC 7235, 3.2
    case proxyAuthRequired            = 407
    /// RFC 7231, 6.5.7
    case requestTimeout               = 408
    /// RFC 7231, 6.5.8
    case conflict                     = 409
    /// RFC 7231, 6.5.9
    case gone                         = 410
    /// RFC 7231, 6.5.10
    case lengthRequired               = 411
    /// RFC 7232, 4.2
    case preconditionFailed           = 412
    /// RFC 7231, 6.5.11
    case requestEntityTooLarge        = 413
    /// RFC 7231, 6.5.12
    case requestURITooLong            = 414
    /// RFC 7231, 6.5.13
    case unsupportedMediaType         = 415
    /// RFC 7233, 4.4
    case requestedRangeNotSatisfiable = 416
    /// RFC 7231, 6.5.14
    case expectationFailed            = 417
    /// RFC 7168, 2.3.3
    case teapot                       = 418
    /// RFC 4918, 11.2
    case unprocessableEntity          = 422
    /// RFC 4918, 11.3
    case locked                       = 423
    /// RFC 4918, 11.4
    case failedDependency             = 424
    /// RFC 7231, 6.5.15
    case upgradeRequired              = 426
    /// RFC 6585, 3
    case preconditionRequired         = 428
    /// RFC 6585, 4
    case tooManyRequests              = 429
    /// RFC 6585, 5
    case requestHeaderFieldsTooLarge  = 431
    /// RFC 7725, 3
    case unavailableForLegalReasons   = 451
    
    /// RFC 7231, 6.6.1
    case internalServerError           = 500
    /// RFC 7231, 6.6.2
    case notImplemented                = 501
    /// RFC 7231, 6.6.3
    case badGateway                    = 502
    /// RFC 7231, 6.6.4
    case serviceUnavailable            = 503
    /// RFC 7231, 6.6.5
    case gatewayTimeout                = 504
    /// RFC 7231, 6.6.6
    case httpVersionNotSupported       = 505
    /// RFC 2295, 8.1
    case variantAlsoNegotiates         = 506
    /// RFC 4918, 11.5
    case insufficientStorage           = 507
    /// RFC 5842, 7.2
    case loopDetected                  = 508
    /// RFC 2774, 7
    case notExtended                   = 510
    /// RFC 6585, 6
    case networkAuthenticationRequired = 511
    
    /// The 520 error is used as a "catch-all response for when the origin server returns something
    /// unexpected", listing connection resets, large headers, and empty or invalid responses as
    /// common triggers.
    case unknown = 520
    
    // MARK: Custom Error Codes
    
    /// Expected response's body not received.
    case noPayload = 600
    
    /// JSONDecoder failed to decode response body.
    case decodeFailed = 601
    
    /// Access is limited to admins only
    case adminsOnly = 602
    
    public var text: String {
        switch self {
        case .continue:                         return NSLocalizedString("StatusCode/Continue", comment: "")
        case .switchingProtocols:               return NSLocalizedString("StatusCode/Switching Protocols", comment: "")
        case .processing:                       return NSLocalizedString("StatusCode/Processing", comment: "")
        case .ok:                               return NSLocalizedString("StatusCode/OK", comment: "")
        case .created:                          return NSLocalizedString("StatusCode/Created", comment: "")
        case .accepted:                         return NSLocalizedString("StatusCode/Accepted", comment: "")
        case .nonAuthoritativeInfo:             return NSLocalizedString("StatusCode/Non-Authoritative Info", comment: "")
        case .noContent:                        return NSLocalizedString("StatusCode/No Content", comment: "")
        case .resetContent:                     return NSLocalizedString("StatusCode/Reset Content", comment: "")
        case .partialContent:                   return NSLocalizedString("StatusCode/Partial Content", comment: "")
        case .multiStatus:                      return NSLocalizedString("StatusCode/Multi Status", comment: "")
        case .alreadyReported:                  return NSLocalizedString("StatusCode/Already Reported", comment: "")
        case .IMUsed:                           return NSLocalizedString("StatusCode/IM Used", comment: "")
        case .multipleChoices:                  return NSLocalizedString("StatusCode/Multiple Choices", comment: "")
        case .movedPermanently:                 return NSLocalizedString("StatusCode/Moved Permanently", comment: "")
        case .found:                            return NSLocalizedString("StatusCode/Found", comment: "")
        case .seeOther:                         return NSLocalizedString("StatusCode/See Other", comment: "")
        case .notModified:                      return NSLocalizedString("StatusCode/Not Modified", comment: "")
        case .useProxy:                         return NSLocalizedString("StatusCode/Use Proxy", comment: "")
        case .temporaryRedirect:                return NSLocalizedString("StatusCode/Temporary Redirect", comment: "")
        case .permanentRedirect:                return NSLocalizedString("StatusCode/Permanent Redirect", comment: "")
        case .badRequest:                       return NSLocalizedString("StatusCode/Bad Request", comment: "")
        case .unauthorized:                     return NSLocalizedString("StatusCode/Unauthorized", comment: "")
        case .paymentRequired:                  return NSLocalizedString("StatusCode/Payment Required", comment: "")
        case .forbidden:                        return NSLocalizedString("StatusCode/Forbidden", comment: "")
        case .notFound:                         return NSLocalizedString("StatusCode/Not Found", comment: "")
        case .methodNotAllowed:                 return NSLocalizedString("StatusCode/Method Not Allowed", comment: "")
        case .notAcceptable:                    return NSLocalizedString("StatusCode/Not Acceptable", comment: "")
        case .proxyAuthRequired:                return NSLocalizedString("StatusCode/Proxy AuthRequired", comment: "")
        case .requestTimeout:                   return NSLocalizedString("StatusCode/Request Timeout", comment: "")
        case .conflict:                         return NSLocalizedString("StatusCode/Conflict", comment: "")
        case .gone:                             return NSLocalizedString("StatusCode/Gone", comment: "")
        case .lengthRequired:                   return NSLocalizedString("StatusCode/Length Required", comment: "")
        case .preconditionFailed:               return NSLocalizedString("StatusCode/Precondition Failed", comment: "")
        case .requestEntityTooLarge:            return NSLocalizedString("StatusCode/Request Entity Too Large", comment: "")
        case .requestURITooLong:                return NSLocalizedString("StatusCode/Request URI Too Long", comment: "")
        case .unsupportedMediaType:             return NSLocalizedString("StatusCode/Unsupported Media Type", comment: "")
        case .requestedRangeNotSatisfiable:     return NSLocalizedString("StatusCode/Requested Range Not Satisfiable", comment: "")
        case .expectationFailed:                return NSLocalizedString("StatusCode/Expectation Failed", comment: "")
        case .teapot:                           return NSLocalizedString("StatusCode/Teapot", comment: "")
        case .unprocessableEntity:              return NSLocalizedString("StatusCode/Unprocessable Entity", comment: "")
        case .locked:                           return NSLocalizedString("StatusCode/Locked", comment: "")
        case .failedDependency:                 return NSLocalizedString("StatusCode/Failed Dependency", comment: "")
        case .upgradeRequired:                  return NSLocalizedString("StatusCode/Upgrade Required", comment: "")
        case .preconditionRequired:             return NSLocalizedString("StatusCode/Precondition Required", comment: "")
        case .tooManyRequests:                  return NSLocalizedString("StatusCode/Too Many Requests", comment: "")
        case .requestHeaderFieldsTooLarge:      return NSLocalizedString("StatusCode/Request Header Fields TooLarge", comment: "")
        case .unavailableForLegalReasons:       return NSLocalizedString("StatusCode/Unavailable For Legal Reasons", comment: "")
        case .internalServerError:              return NSLocalizedString("StatusCode/Internal Server Error", comment: "")
        case .notImplemented:                   return NSLocalizedString("StatusCode/Not Implemented", comment: "")
        case .badGateway:                       return NSLocalizedString("StatusCode/Bad Gateway", comment: "")
        case .serviceUnavailable:               return NSLocalizedString("StatusCode/Service Unavailable", comment: "")
        case .gatewayTimeout:                   return NSLocalizedString("StatusCode/Gateway Timeout", comment: "")
        case .httpVersionNotSupported:          return NSLocalizedString("StatusCode/HTTP Version Not Supported", comment: "")
        case .variantAlsoNegotiates:            return NSLocalizedString("StatusCode/Variant Also Negotiates", comment: "")
        case .insufficientStorage:              return NSLocalizedString("StatusCode/Insufficient Storage", comment: "")
        case .loopDetected:                     return NSLocalizedString("StatusCode/Loop Detected", comment: "")
        case .notExtended:                      return NSLocalizedString("StatusCode/Not Extended", comment: "")
        case .networkAuthenticationRequired:    return NSLocalizedString("StatusCode/Network Authentication Required", comment: "")
        case .unknown:                          return NSLocalizedString("StatusCode/Unknown Error", comment: "")
        case .noPayload:                        return NSLocalizedString("StatusCode/No Payload", comment: "")
        case .decodeFailed:                     return NSLocalizedString("StatusCode/Decode Failed", comment: "")
        case .adminsOnly:                       return NSLocalizedString("StatusCode/Admins Only", comment: "")
        }
    }
}
