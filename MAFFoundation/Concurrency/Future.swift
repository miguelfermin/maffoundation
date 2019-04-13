//
//  Future.swift
//  MAFFoundation
//
//  Created by Miguel Fermin on 10/6/18.
//  Copyright © 2018 MAF Software LLC. All rights reserved.
//

import Foundation

final public class Future<T> {
    private let queue: DispatchQueue
    private var callbacks: [(Result<T, APIError>) -> ()] = []
    private var result: Result<T, APIError>?
    
    public init(compute: (@escaping (Result<T, APIError>) -> Void) -> Void) {
        let label = "com.mafsoftware.MAFFoundation.Future.\(UUID().uuidString)"
        queue = DispatchQueue(label: label, attributes: .concurrent)
        queue.sync { compute(self.send) }
    }
    
    private func send(_ value: Result<T, APIError>) {
        assert(result == nil)
        result = value
        for callback in callbacks { callback(value) }
        callbacks = []
    }
    
    final public func completionHandler(callback: @escaping (Result<T, APIError>) -> ()) {
        queue.sync {
            if let value = result {
                DispatchQueue.main.async { callback(value) }
            } else {
                callbacks.append(callback)
            }
        }
    }
}
