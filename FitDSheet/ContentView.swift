//
//  ContentView.swift
//  FitDSheet
//
//  Created by Lindar Olostur on 09.11.2025.
//

import SwiftUI
import WebKit

struct ContentView: View {
    var body: some View {
        WebView()
            .edgesIgnoringSafeArea(.all)
    }
}

struct WebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        
        // Загружаем HTML файл из бандла
        if let htmlPath = Bundle.main.path(forResource: "App", ofType: "html") {
            let htmlURL = URL(fileURLWithPath: htmlPath)
            let htmlString = try? String(contentsOf: htmlURL, encoding: .utf8)
            webView.loadHTMLString(htmlString ?? "", baseURL: htmlURL.deletingLastPathComponent())
        }
        
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        // Обновление не требуется
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        // Можно добавить обработку навигации при необходимости
    }
}

#Preview {
    ContentView()
}
