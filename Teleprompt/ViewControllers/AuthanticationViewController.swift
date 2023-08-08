//
//  AuthanticationViewController.swift
//  Venuedock
//
//  Created by Mac on 13/06/2023.
//

import UIKit
import WebKit
class AuthanticationViewController: UIViewController {
    weak var coordinator: Coordinator?
    
    private let webView: WKWebView = {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        let webView = WKWebView(frame: .zero, configuration: config)
        return webView
    }()
    
    public var completionHandler:((Bool)->Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        webView.navigationDelegate = self
        view.addSubview(webView)
//        guard let url = AuthManager.shared.signInURL else {
//            return
//        }
        
//        webView.load(URLRequest(url:url))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
}

extension AuthanticationViewController:WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        guard let url = webView.url else {
            return
        }
        // Exchange the code for acess token
        guard let code = URLComponents(url: url, resolvingAgainstBaseURL: true)?.queryItems?.first(where: { $0.name == "code" })?.value else {
            return
        }
        DispatchQueue.main.async {
//            AuthManager.shared.exchangeCodeForToken(code: code) {[weak self] success in
//                DispatchQueue.main.async {
//
//                    self?.coordinator?.popMeToRootViewController()
//                    self?.completionHandler!(success)
//                }
//            }
            
        }
        
        
    }
}
