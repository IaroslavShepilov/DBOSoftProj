//
//  MainViewModel.swift
//  DBOSoftTestProj
//
//  Created by Yaroslav Shepilov
//

import Foundation

protocol MainViewModelProtocol {
    func updateArticlesInfo(response: [ArticlesInfo])
}

final class MainViewModel {
   
    var delegate: MainViewModelProtocol?
    var articlesInfo = [ArticlesInfo]()
    
    func getArticles() {
        NetworkService.request(router: GetArticleRequest()) { [weak self] (result: Result<GetArticleResponse, Error>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self?.delegate?.updateArticlesInfo(response: response.articles)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
