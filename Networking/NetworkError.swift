//
//  NetworkError.swift
//  DBOSoftTestProj
//
//  Created by Yaroslav Shepilov on 01.08.2022.
//

import Foundation

public enum NetworkError: Error {
    case invalidURL(urlPath: String)
    case emptyResponse(urlPath: String)
    case emptyResponseData(urlPath: String)
}

extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidURL(let urlPath):
            return "Invalid URL" + "\n URL path: " + urlPath
        case .emptyResponse(let urlPath):
            return "Response is missing" + "\n URL: " + urlPath
        case .emptyResponseData(let urlPath):
            return "Response data is missing" + "\n URL: " + urlPath
        }
    }
}
