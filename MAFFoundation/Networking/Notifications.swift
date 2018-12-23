//
//  Notifications.swift
//  MAFFoundation
//
//  Created by Miguel Fermin on 9/10/18.
//  Copyright © 2018 MAF Software LLC. All rights reserved.
//

import Foundation

/// API related notifications.
public struct Notifications {
    /// Posted when authentication is required.
    public static let authRequired = NSNotification.Name("com.mafsoftware.MAFFoundation.authRequired")
}
