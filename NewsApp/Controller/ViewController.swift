//
//  ViewController.swift
//  NewsApp
//
//  Created by Kaushal Topinkatti B on 25/05/21.
//

import UIKit

class ViewController: UIViewController, NewsManagerDelegate, UITableViewDataSource {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var topicButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var newsManager = NewsManager()
    var getData = GetData()
    
    var newsArray = [NewsModel?]()
    //var myReturnedArray: [NewsModel?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //newManager.delegate = self should always come first...!!!!!
        newsManager.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "NewsCell2", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        newsManager.fetchNews(topic: "business")
    }
    
    //NewManagerDelaget Methods
    func didUpdateNews(_ newsManager: NewsManager, news: [NewsModel?]) {

        newsArray = []
        
        DispatchQueue.main.async {
            
            for data in news {
                self.newsArray.append(NewsModel(sourceName: data!.sourceName, newsTitle: data!.newsTitle, newsImage: data!.newsImage))
            }
            
            self.tableView.reloadData()
            
            for i in self.newsArray {
                print(i!.sourceName)
            }
        }
    }

    func didFaildWithError(error: Error) {
        print(error)
    }
    
    
    //UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let news = self.newsArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! NewsCell2
        
//        cell.providerName.text = news?.sourceName
//        cell.titleLabel.text = news?.newsTitle
        
        cell.sourceName.text = news?.sourceName
        cell.title.text = news?.newsTitle
        cell.newsImage.image = news?.newsImage
        
        return cell
    }
    
}
