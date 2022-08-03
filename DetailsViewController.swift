//
//  DetailsViewController.swift
//  DBOSoftTestProj
//
//  Created by Yaroslav Shepilov on 01.08.2022.
//

import UIKit
import WebKit

class DetailsViewController: UIViewController {
    
    private let webViev: WKWebView = {
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = preferences
        let webView = WKWebView(frame: .zero, configuration: configuration)
        return webView
    }()
    
    private let url : URL
    
    init(url: URL) {
        self.url = url
        super.init(nibName: "DetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webViev)
        webViev.load(URLRequest(url: url))

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webViev.frame = view.bounds
    }
}
