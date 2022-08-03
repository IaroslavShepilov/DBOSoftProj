//
//  MainViewController.swift
//  DBOSoftTestProj
//
//  Created by Yaroslav Shepilov on 01.08.2022.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    private var model = MainViewModel()
    private var articlesInfo = [ArticlesInfo]()
    private var filteredArticles = [ArticlesInfo]()
    private var isFiltering = false
    var didAppear = false
    private var searcBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.model.delegate = self
        setupTableView()
        model.getArticles()
        setupSearchController()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        didAppear = true
    }
    
    func setupTableView() {
        title = "Apple news from July 31, 2022"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "reuseIdentifier")
    }
    
    func setupSearchController() {
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        navigationItem.searchController = searchController
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredArticles.count
        }
        return articlesInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! CustomTableViewCell
        let articles : ArticlesInfo
        if isFiltering {
            articles = filteredArticles[indexPath.row]
        } else {
            articles = articlesInfo[indexPath.row]
        }
        cell.setupWith(articles, index: indexPath.row)        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var  articles = articlesInfo[indexPath.row]
        if isFiltering {
            articles = filteredArticles[indexPath.row]
        } else {
            articles = articlesInfo[indexPath.row]
        }
        guard let url = URL(string: articles.url) else {return}
        let vc = DetailsViewController(url: url)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension MainViewController: MainViewModelProtocol {
    func updateArticlesInfo(response: [ArticlesInfo]) {
        self.articlesInfo = response
        tableView.reloadData()
    }
}

extension MainViewController: UISearchResultsUpdating, UISearchControllerDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text)
        tableView.reloadData()
    }
   
    func willPresentSearchController(_ searchController: UISearchController) {
        isFiltering = true
        tableView.reloadData()
    }

    func willDismissSearchController(_ searchController: UISearchController) {
        isFiltering = false
        tableView.reloadData()
    }
    
    private func filterContentForSearchText(_ searchText: String?) {
        filteredArticles = articlesInfo.filter {
            let articles = $0.title.lowercased()
            return articles.contains(searchText?.lowercased() ?? "")
        }
      tableView.reloadData()
    }
}



