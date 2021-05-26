//
//  NewsData.swift
//  NewsApp
//
//  Created by Kaushal Topinkatti B on 25/05/21.
//

import Foundation

struct NewsData: Codable {
    
    let articles: [NewsObjects]
    
}

struct NewsObjects: Codable {
    let source: Source
    let title: String
    let urlToImage: String
}

struct Source: Codable {
    let name: String
}
