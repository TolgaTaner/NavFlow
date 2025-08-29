//
//  NavFlowNavigationContainerView.swift
//  NavFlow
//
//  Created by Tolga Taner on 17.08.2025.
//

import SwiftUI

struct NavFlowNavigationContainerView<NavigationBarView: View, Content: View>: View {
    
    let navigationBarView: NavigationBarView
    let content: Content
    let backgroundColor: Color
    let height: NavigationBarHeight
    
    init(backgroundColor: Color,
         height: NavigationBarHeight,
         @ViewBuilder navigationBarView: () -> NavigationBarView,
         @ViewBuilder content: () -> Content) {
        self.navigationBarView = navigationBarView()
        self.content = content()
        self.backgroundColor = backgroundColor
        self.height = height
    }
    
    var body: some View {
        NavFlowNavigationBarView(backgroundColor: backgroundColor, navigationBarHeight: height, navigationBarView: { navigationBarView }) {
            ZStack {
                Color.clear
                    .ignoresSafeArea()
                content
            }
        }
    }
}
