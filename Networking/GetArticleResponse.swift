//
//  GetArticleResponse.swift
//  DBOSoftTestProj
//
//  Created by Yaroslav Shepilov on 01.08.2022.
//

import Foundation

struct GetArticleResponse: Codable {
    let articles: [ArticlesInfo]
}

struct ArticlesInfo: Codable {
    let source: SourceInfo
    let author: String?
    let title: String
    let description: String
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String
}

struct SourceInfo: Codable {
    let id: String?
    let name: String
}
