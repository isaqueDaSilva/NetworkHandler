//
//  HTTPHeaderField.swift
//  NetworkHandler
//
//  Created by Isaque da Silva on 29/07/24.
//

import Foundation

extension NetworkService {
    /// Stores the all HTTP header field used in the App.
    public enum HTTPHeaderField: String {
        case authorization = "Authorization"
        case contentType = "Content-Type"
    }
}
