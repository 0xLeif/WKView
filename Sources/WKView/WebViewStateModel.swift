//
//  WebViewStateModel.swift
//  
//
//  Created by Alex Nagy on 09.12.2020.
//

import SwiftUI

class WebViewStateModel: ObservableObject {
    @Published var loading: Bool = true
    @Published var canGoBack: Bool = false
    @Published var goBack: Bool = false
    @Published var canGoForward: Bool = false
    @Published var goForward: Bool = false
    @Published var reload: Bool = false
}
