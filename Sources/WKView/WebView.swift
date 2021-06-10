//
//  WebView.swift
//
//
//  Created by Alex Nagy on 09.12.2020.
//

import SwiftUI
import UIKit
import WebKit

public struct WebView<LoadingContent: View>: View {
    
    let data: WebViewData
    var allowedHosts: [String]?
    var forbiddenHosts: [String]?
    var credential: URLCredential?
    var onNavigationAction: ((_ navigationAction: WebPresenterView.NavigationAction) -> Void)?
    var loadingView: () -> LoadingContent
    
    public init(
        data: WebViewData,
        allowedHosts: [String]? = nil,
        forbiddenHosts: [String]? = nil,
        credential: URLCredential? = nil,
        onNavigationAction: ((_ navigationAction: WebPresenterView.NavigationAction) -> Void)? = nil,
        loadingView: @escaping () -> LoadingContent
    ) {
        self.data = data
        self.allowedHosts = allowedHosts
        self.forbiddenHosts = forbiddenHosts
        self.credential = credential
        self.onNavigationAction = onNavigationAction
        self.loadingView = loadingView
    }
    
    @ObservedObject var webViewStateModel: WebViewStateModel = WebViewStateModel()
    
    public var body: some View {
        WebPresenterView(
            webViewData: data,
            webViewStateModel: webViewStateModel,
            onNavigationAction: onNavigationAction,
            allowedHosts: allowedHosts,
            forbiddenHosts: forbiddenHosts,
            credential: credential
        )
        .overlay(loadingContent)
    }
    
    private var loadingContent: some View {
        Group {
            if webViewStateModel.loading {
                loadingView()
            } else {
                EmptyView()
            }
        }
    }
}
