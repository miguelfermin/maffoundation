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
        case .continue:                         return Localized("StatusCode/Continue")
        case .switchingProtocols:               return Localized("StatusCode/Switching Protocols")
        case .processing:                       return Localized("StatusCode/Processing")
        case .ok:                               return Localized("StatusCode/OK")
        case .created:                          return Localized("StatusCode/Created")
        case .accepted:                         return Localized("StatusCode/Accepted")
        case .nonAuthoritativeInfo:             return Localized("StatusCode/Non-Authoritative Info")
        case .noContent:                        return Localized("StatusCode/No Content")
        case .resetContent:                     return Localized("StatusCode/Reset Content")
        case .partialContent:                   return Localized("StatusCode/Partial Content")
        case .multiStatus:                      return Localized("StatusCode/Multi Status")
        case .alreadyReported:                  return Localized("StatusCode/Already Reported")
        case .IMUsed:                           return Localized("StatusCode/IM Used")
        case .multipleChoices:                  return Localized("StatusCode/Multiple Choices")
        case .movedPermanently:                 return Localized("StatusCode/Moved Permanently")
        case .found:                            return Localized("StatusCode/Found")
        case .seeOther:                         return Localized("StatusCode/See Other")
        case .notModified:                      return Localized("StatusCode/Not Modified")
        case .useProxy:                         return Localized("StatusCode/Use Proxy")
        case .temporaryRedirect:                return Localized("StatusCode/Temporary Redirect")
        case .permanentRedirect:                return Localized("StatusCode/Permanent Redirect")
        case .badRequest:                       return Localized("StatusCode/Bad Request")
        case .unauthorized:                     return Localized("StatusCode/Unauthorized")
        case .paymentRequired:                  return Localized("StatusCode/Payment Required")
        case .forbidden:                        return Localized("StatusCode/Forbidden")
        case .notFound:                         return Localized("StatusCode/Not Found")
        case .methodNotAllowed:                 return Localized("StatusCode/Method Not Allowed")
        case .notAcceptable:                    return Localized("StatusCode/Not Acceptable")
        case .proxyAuthRequired:                return Localized("StatusCode/Proxy AuthRequired")
        case .requestTimeout:                   return Localized("StatusCode/Request Timeout")
        case .conflict:                         return Localized("StatusCode/Conflict")
        case .gone:                             return Localized("StatusCode/Gone")
        case .lengthRequired:                   return Localized("StatusCode/Length Required")
        case .preconditionFailed:               return Localized("StatusCode/Precondition Failed")
        case .requestEntityTooLarge:            return Localized("StatusCode/Request Entity Too Large")
        case .requestURITooLong:                return Localized("StatusCode/Request URI Too Long")
        case .unsupportedMediaType:             return Localized("StatusCode/Unsupported Media Type")
        case .requestedRangeNotSatisfiable:     return Localized("StatusCode/Requested Range Not Satisfiable")
        case .expectationFailed:                return Localized("StatusCode/Expectation Failed")
        case .teapot:                           return Localized("StatusCode/Teapot")
        case .unprocessableEntity:              return Localized("StatusCode/Unprocessable Entity")
        case .locked:                           return Localized("StatusCode/Locked")
        case .failedDependency:                 return Localized("StatusCode/Failed Dependency")
        case .upgradeRequired:                  return Localized("StatusCode/Upgrade Required")
        case .preconditionRequired:             return Localized("StatusCode/Precondition Required")
        case .tooManyRequests:                  return Localized("StatusCode/Too Many Requests")
        case .requestHeaderFieldsTooLarge:      return Localized("StatusCode/Request Header Fields TooLarge")
        case .unavailableForLegalReasons:       return Localized("StatusCode/Unavailable For Legal Reasons")
        case .internalServerError:              return Localized("StatusCode/Internal Server Error")
        case .notImplemented:                   return Localized("StatusCode/Not Implemented")
        case .badGateway:                       return Localized("StatusCode/Bad Gateway")
        case .serviceUnavailable:               return Localized("StatusCode/Service Unavailable")
        case .gatewayTimeout:                   return Localized("StatusCode/Gateway Timeout")
        case .httpVersionNotSupported:          return Localized("StatusCode/HTTP Version Not Supported")
        case .variantAlsoNegotiates:            return Localized("StatusCode/Variant Also Negotiates")
        case .insufficientStorage:              return Localized("StatusCode/Insufficient Storage")
        case .loopDetected:                     return Localized("StatusCode/Loop Detected")
        case .notExtended:                      return Localized("StatusCode/Not Extended")
        case .networkAuthenticationRequired:    return Localized("StatusCode/Network Authentication Required")
        case .unknown:                          return Localized("StatusCode/Unknown Error")
        case .noPayload:                        return Localized("StatusCode/No Payload")
        case .decodeFailed:                     return Localized("StatusCode/Decode Failed")
        case .adminsOnly:                       return Localized("StatusCode/Admins Only")
        }
    }
}
