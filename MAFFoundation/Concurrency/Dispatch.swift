//
//  Dispatch.swift
//  MAFFoundation
//
//  Created by Miguel Fermin on 11/22/18.
//  Copyright © 2018 MAF Software LLC. All rights reserved.
//

import Foundation

public enum Dispatch {
    /// Sleeps for the specified delay interval then invokes the "then" block
    /// in the main thread.
    ///
    /// - Parameters:
    ///   - delay: The delay interval in seconds.
    ///   - then: The closure to invoke after the delay.
    public static func after(_ delay: Double, then: @escaping () -> Void) {
        let d = DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: d) { then() }
    }
}
