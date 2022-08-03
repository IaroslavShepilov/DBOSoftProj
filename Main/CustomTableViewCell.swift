//
//  CustomTableViewCell.swift
//  DBOSoftTestProj
//
//  Created by Yaroslav Shepilov on 01.08.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var articleTitleLable: UILabel!
    @IBOutlet weak var articlesDescriptionLabel: UILabel!
    
    private var index: Int?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupWith(_ articles: ArticlesInfo, index: Int) {
        self.index = index
        articleTitleLable.text = articles.title
        articleTitleLable.font = UIFont.boldSystemFont(ofSize: 20)
        articlesDescriptionLabel.text = articles.description
        let urlString = articles.urlToImage
        guard let url = URL(string: urlString ?? "") else {return}
        newsImageView.downloaded(from: url)
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFill) {
        DispatchQueue.global().async {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                    let data = data, error == nil,
                    let image = UIImage(data: data)
                else { return }
                DispatchQueue.main.async { [weak self] in
                    self?.image = image
                    self?.contentMode = mode
                }
            }.resume()
        }
    }

    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}


