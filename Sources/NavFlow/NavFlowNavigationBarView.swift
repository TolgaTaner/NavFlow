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
    private let path: Binding<NavigationPath>?
    private let registerDestinations: ((AnyView) -> AnyView)?
    
    init(path: Binding<NavigationPath>? = nil,
         backgroundColor: Color,
         navigationBarHeight: NavigationBarHeight,
         @ViewBuilder navigationBarView: () -> NavigationBarView,
         @ViewBuilder content: () -> Content,
         registerDestinations: ((AnyView) -> AnyView)? = nil) {
        self.navigationBarView = navigationBarView()
        self.content = content()
        self.backgroundColor = backgroundColor
        self.navigationBarHeight = navigationBarHeight
        self.path = path
        self.registerDestinations = registerDestinations
    }
    
    var body: some View {
        Group {
            if let path {
                NavigationStack(path: path) {
                    let base = AnyView(
                        VStack(spacing: 0) {
                            navigationBarView
                                .foregroundStyle(.white)
                                .frame(height: navigationBarHeight.value)
                                .frame(maxWidth: .infinity)
                                .background(
                                    backgroundColor.ignoresSafeArea(edges: .top)
                                )
                            content
                        }
                        .navigationBarBackButtonHidden(true)
                    )
                    if let registerDestinations {
                        registerDestinations(base)
                    } else {
                        base
                    }
                }
            } else {
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
                    }
                    .navigationBarBackButtonHidden(true)
                }
            }
        }
    }
}
