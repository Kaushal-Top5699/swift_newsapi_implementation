//
//  NewsManager.swift
//  NewsApp
//
//  Created by Kaushal Topinkatti B on 25/05/21.
//

import Foundation
import UIKit

protocol NewsManagerDelegate {
    func didUpdateNews(_ newsManager: NewsManager, news: [NewsModel?])
    func didFaildWithError(error: Error)
}

struct NewsManager {
    
    var newsUrl = "https://newsapi.org/v2/top-headlines?country=in&apiKey=ae4b8574026848bebb4e6b7e274dd25b"
    
    func fetchNews(topic: String)  {
        let urlString = "\(newsUrl)&category=\(topic)"
        print("URL link: \(urlString)")
        performRequest(with: urlString)
    }
    
    var delegate: NewsManagerDelegate?
    
    func performRequest(with urlString: String) {
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                
                if let err = error {
                    delegate?.didFaildWithError(error: err)
                    return
                }
                if let safeData = data {
                    var news: [NewsModel?] = []
                    news = parseJSON(safeData)
//                    for data in news {
//                        //print(data!.sourceName)
//                        //print(data!.newsTitle)
//                    }
                    delegate?.didUpdateNews(self, news: news)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ newsData: Data) -> [NewsModel?] {
        let decoder = JSONDecoder()
        var news: [NewsModel?] = []
        do {
            let decodedData = try decoder.decode(NewsData.self, from: newsData)
            news = []
            for article in decodedData.articles {

                let name = article.source.name
                let title = article.title
                let imageURL = article.urlToImage
                let url = URL(string: imageURL)
                let data = try? Data(contentsOf: url!)
                let image = UIImage(data: data!)
                news.append(NewsModel(sourceName: name, newsTitle: title, newsImage: image!))
            }
            return news
        } catch {
            delegate?.didFaildWithError(error: error)
            return news
        }
    }
}

