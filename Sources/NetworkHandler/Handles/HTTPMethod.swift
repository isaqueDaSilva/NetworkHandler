//
//  HTTPMethod.swift
//  NetworkHandler
//
//  Created by Isaque da Silva on 29/07/24.
//

import Foundation

extension NetworkService {
    /// Stores the all HTTP methods.
    public enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case patch = "PATCH"
        case delete = "DELETE"
    }
}
