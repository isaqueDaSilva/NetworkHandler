//
//  AuthorizationHeader.swift
//  NetworkHandler
//
//  Created by Isaque da Silva on 29/07/24.
//

import Foundation

extension NetworkService {
    /// Stores the all authorization headers.
    enum AuthorizationHeader: String {
        case bearer = "Bearer"
        case basic = "Basic"
    }
}
