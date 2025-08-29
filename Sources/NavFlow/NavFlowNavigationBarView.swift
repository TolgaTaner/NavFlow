//
//  NavFlowNavigationBarView.swift
//  NavFlow
//
//  Created by Tolga Taner on 26.03.2025.
//

import SwiftUI

struct NavFlowNavigationBarView<NavigationBarView: View, Content: View>: View {
    
    let navigationBarView: NavigationBarView
    let content: Content
    private let navigationBarHeight: NavigationBarHeight
    private let backgroundColor: Color
    
    init(backgroundColor: Color,
         navigationBarHeight: NavigationBarHeight,
         @ViewBuilder navigationBarView: () -> NavigationBarView,
         @ViewBuilder content: () -> Content) {
        self.navigationBarView = navigationBarView()
        self.content = content()
        self.backgroundColor = backgroundColor
        self.navigationBarHeight = navigationBarHeight
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                navigationBarView
                    .foregroundStyle(.white)
                    .frame(height: navigationBarHeight.value)
                    .frame(maxWidth: .infinity)
                    .background(
                        backgroundColor.ignoresSafeArea(edges: .top)
                    )
                content
                
            }.navigationBarBackButtonHidden(true)
        }
    }
}
