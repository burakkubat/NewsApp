//
//  NewsModel.swift
//  News MVVM
//
//  Created by Burak Kubat on 2.04.2023.
//

import Foundation

struct News: Decodable {
    let articles: [Article]?
}

struct Article: Decodable {
    let author: String?
    let title: String?
    let description:String?
    let url: String?
    let urlToImage: String?
    let content: String?
}
