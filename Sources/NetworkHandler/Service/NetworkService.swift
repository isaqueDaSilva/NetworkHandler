//
//  NetworkService.swift
//  NetworkHandler
//
//  Created by Isaque da Silva on 29/07/24.
//

import Foundation

/// A model that represents steps of the the Network Service.
public struct NetworkService: Sendable {
    /// A endpoint that will be use for access the request and gets the data.
    private let endpoint: String
    
    /// A collection of values that will be pass for a HTTP header field.
    private let values: [Values]
    
    /// A HTTP method that will be use for access the service of the endpoint.
    private let httpMethod: String
    
    /// This represents what we want from this request.
    ///
    /// To obtain data, use `.getData, which will tell URLSession that we only want to receive data;
    ///
    /// To send data, use `.uploadData(:)`, which will tell URLSession that we want to send data in the request;
    private let type: URLSessionType
    
    
    /// Makes a URL representation from the String endpoint.
    /// - Returns: Return a URL representation for the endpoint.
    private func getURL() throws -> URL {
        guard let url = URL(string: endpoint) else {
            throw APIError.badURL
        }
        
        return url
    }
    
    /// Configures a URLRequest for the endpoint based on the Values and HTTP methods submited when this object is instantiate.
    /// - Returns: Returns a URLRequest configurated for uses with a URLSession,
    public func makeRequest() throws -> URLRequest {
        let url = try getURL()
        
        var request = URLRequest(url: url)
        
        if !values.isEmpty {
            for value in values {
                request.setValue(value.value, forHTTPHeaderField: value.httpHeaderField)
            }
        }
        
        request.httpMethod = httpMethod
        
        return request
    }
    
    /// Makes a request in the endpoint.
    /// - Returns: Returns a Data representation and a URLResponse when the request will be finish without error.
    public func run() async throws -> (Data, URLResponse) {
        let request = try makeRequest()
        
        guard let (data, response) = try? await type.urlSession(for: request) else {
            throw APIError.runFailed
        }
        
        return (data, response)
    }
    
    public init(
        endpoint: String,
        values: [Values] = [],
        httpMethod: HTTPMethod,
        type: URLSessionType
    ) {
        self.endpoint = endpoint
        self.values = values
        self.httpMethod = httpMethod.rawValue
        self.type = type
    }
}
