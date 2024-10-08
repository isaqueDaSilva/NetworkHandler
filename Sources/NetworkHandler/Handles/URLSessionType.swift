//
//  URLSessionType.swift
//  NetworkHandler
//
//  Created by Isaque da Silva on 29/07/24.
//

import Foundation

extension NetworkService {
    /// Stores the all use cases what do you expect receive when some request finish.
    public enum URLSessionType: Sendable {
        /// Use this case when do you wants get only data for the request.
        case getData
        
        /// Use this case when do you want send data for the request.
        case uploadData(Data)
        
        /// A method that get a URLRequest and return a Data and URLResponse tuple value base on the case selected.
        /// - Returns: Returns a Data and URLResponse tuple value base on the case selected.
        public func makeRequest(
            with session: URLSession,
            and request: URLRequest
        ) async throws -> (Data, URLResponse) {
            switch self {
            case .getData:
                return try await session.data(for: request)
            case .uploadData(let data):
                return try await session.upload(for: request, from: data)
            }
        }
    }
}
