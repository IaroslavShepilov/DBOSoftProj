//
//  NetworkConstants.swift
//  DBOSoftTestProj
//
//  Created by Yaroslav Shepilov on 01.08.2022.
//

import Foundation

public struct NetworkConstants {
 
    public enum Method: String {
        case GET = "GET"
        case POST = "POST"
    }
    
    public enum Path: String {
        case articles = "/v2/everything"
    }

    public static let scheme = "https"
    public static let host = "newsapi.org"
    public static let apiKey = "1c1fc3443f2644468db108be0495404a"
}

