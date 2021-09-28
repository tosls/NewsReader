//
//  NewsModel.swift
//  NewsReader
//
//  Created by Антон Бобрышев on 28.09.2021.
//

import UIKit

struct NewsModel: Codable {
    
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
}

struct Source: Codable {
    let name: String
}
