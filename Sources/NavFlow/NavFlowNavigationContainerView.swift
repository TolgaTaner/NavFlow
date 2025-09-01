//
//  NavFlowNavigationContainerView.swift
//  NavFlow
//
//  Created by Tolga Taner on 17.08.2025.
//

import SwiftUI

public struct NavFlowNavigationContainerView<NavigationBarView: View, Content: View>: View {
    
    let navigationBarView: NavigationBarView
    let content: Content
    let backgroundColor: Color
    let height: NavigationBarHeight
    let path: Binding<NavigationPath>?
    let registerDestinations: ((AnyView) -> AnyView)?
    
    public init(path: Binding<NavigationPath>? = nil,
         backgroundColor: Color,
         height: NavigationBarHeight,
         @ViewBuilder navigationBarView: () -> NavigationBarView,
         @ViewBuilder content: () -> Content,
         registerDestinations: ((AnyView) -> AnyView)? = nil) {
        self.navigationBarView = navigationBarView()
        self.content = content()
        self.backgroundColor = backgroundColor
        self.height = height
        self.path = path
        self.registerDestinations = registerDestinations
    }
    
    public var body: some View {
        NavFlowNavigationBarView(path: path,
                                 backgroundColor: backgroundColor,
                                 navigationBarHeight: height,
                                 navigationBarView: { navigationBarView },
                                 content: {
            ZStack {
                Color.clear
                    .ignoresSafeArea()
                content
            }
        },
                                 registerDestinations: registerDestinations)
    }
}
