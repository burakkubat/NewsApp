//
//  ViewController.swift
//  News MVVM
//
//  Created by Burak Kubat on 2.04.2023.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var newsTableView: UITableView!
    let newsViewModel = NewsViewModel()
    var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        newsViewModel.getNews { [weak self] (articles) in
                 if let articles = articles {
                     self?.articles = articles
                     DispatchQueue.main.async {
                         self?.newsTableView.reloadData()
                     }
                 }
             }
         }
        
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath)
        cell.textLabel?.text = articles[indexPath.row].title
        return cell
    }
}


