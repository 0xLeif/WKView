//
//  WebView.swift
//
//
//  Created by Alex Nagy on 09.12.2020.
//

import SwiftUI
import UIKit
import WebKit

@available(iOS 14.0, *)
public struct WebView: View {
    
    let data: WebViewData
    let tintColor: Color
    var allowedHosts: [String]?
    var forbiddenHosts: [String]?
    var credential: URLCredential?
    var onNavigationAction: ((_ navigationAction: WebPresenterView.NavigationAction) -> Void)?
    
    public init(
        data: WebViewData,
        tintColor: Color = .blue,
        allowedHosts: [String]? = nil,
        forbiddenHosts: [String]? = nil,
        credential: URLCredential? = nil,
        onNavigationAction: ((_ navigationAction: WebPresenterView.NavigationAction) -> Void)? = nil
    ) {
        self.data = data
        self.tintColor = tintColor
        self.allowedHosts = allowedHosts
        self.forbiddenHosts = forbiddenHosts
        self.credential = credential
        self.onNavigationAction = onNavigationAction
    }
    
    @StateObject var webViewStateModel: WebViewStateModel = WebViewStateModel()
    @Environment(\.presentationMode) var presentationMode
    
    public var body: some View {
        LoadingView(isShowing: .constant(webViewStateModel.loading)) {
            WebPresenterView(
                webViewData: data,
                webViewStateModel: webViewStateModel,
                onNavigationAction: onNavigationAction,
                allowedHosts: allowedHosts,
                forbiddenHosts: forbiddenHosts,
                credential: credential
            )
        }
    }
}
