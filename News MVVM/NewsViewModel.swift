//
//  NewsViewModel.swift
//  News MVVM
//
//  Created by Burak Kubat on 2.04.2023.
//

import Foundation

struct ApiUrl {
    static let baseUrl = "https://newsapi.org/v2/"
    static let apiKey = "96f226c5a1a949f3b6153c118a0bc2df"
    static let newsTopic = "apple"
}

class NewsViewModel {
    
        func getNews(completion: @escaping ([Article]?) -> ()) {
        
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=apple&apiKey=96f226c5a1a949f3b6153c118a0bc2df") else {
            print("Url Error")
            return
        }
        
        NetworkManager.shared.getData(url: url) { result in
            
            switch result {
            case .success(let data):
                do {
                    let news = try JSONDecoder().decode(News.self, from: data)
                    completion(news.articles)
                }
                catch {
                   print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
