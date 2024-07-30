//
//  Values.swift
//  NetworkHandler
//
//  Created by Isaque da Silva on 29/07/24.
//

import Foundation

extension NetworkService {
    /// The representation of the values will be pass for a HTTP header field.
    public struct Values: Sendable {
        /// The actual value will be send in a HTTP request.
        let value: String
        
        /// The representation of the type of value being sent in the request
        let httpHeaderField: String
        
        public init(value: String, httpHeaderField: HTTPHeaderField) {
            self.value = value
            self.httpHeaderField = httpHeaderField.rawValue
        }
    }
}
