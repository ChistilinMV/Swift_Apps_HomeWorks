//
//  ViewController.swift
//  HomeWork04 VK_Client
//
//  Created by Max on 26.11.2023.
//

import UIKit
import WebKit

final class ViewController: UIViewController {
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView(frame: view.bounds)
        webView.navigationDelegate = self
        return webView
    }()

    private func loadObjects() {
        view.addSubview(webView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        loadObjects()
        
        guard let url = URL(string: "https://oauth.vk.com/authorize?client_id=51804372&redirect_url=https://oauth.vk.com/blank.html&scope=262150&display=mobile&response_type=token") else
        { return }
        webView.load(URLRequest(url: url))
    }
}

extension ViewController {
    @objc func goToTabView() {
        let tabBarController = TabBarFunc.run()
        tabBarController.modalPresentationStyle = .fullScreen
        let navigationController = UINavigationController(rootViewController: tabBarController)
        self.addChild(navigationController)
        view.addSubview(navigationController.view)
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url,
              url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        NetworkService.token = params[ "access_token" ]!
        NetworkService.userID = params[ "user_id" ]!
        decisionHandler(.cancel)
        webView.removeFromSuperview()
        goToTabView()
    }
}
