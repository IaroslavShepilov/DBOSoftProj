//
//  GetArticleRequest.swift
//  DBOSoftTestProj
//
//  Created by Yaroslav Shepilov on 01.08.2022.
//

import Foundation

struct GetArticleRequest: NetworkRequestProtocol {
    var scheme: String = NetworkConstants.scheme
    var host: String = NetworkConstants.host
    var path: String = NetworkConstants.Path.articles.rawValue
    var parameters: [URLQueryItem] = [
        URLQueryItem(name: "apiKey", value: NetworkConstants.apiKey),
        URLQueryItem(name: "q", value: "apple"),
        URLQueryItem(name: "from", value: "2022-07-31"),
        URLQueryItem(name: "to", value: "2022-07-31"),
        URLQueryItem(name: "sortBy", value: "2022-07-31")
    ]
    var method: NetworkConstants.Method = .GET
    var httpAdditionalHeader: [String : String] = [:]
}
