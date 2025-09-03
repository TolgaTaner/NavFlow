//
//  NavFlowViewModifiers.swift
//  NavFlow
//
//  Created by Assistant on 02.09.2025.
//

import SwiftUI

#if os(iOS)
public extension NavFlowNavigationBarView {
    func hideNavFlowNavigationBar() -> some View {
        self.toolbar(.hidden, for: .navigationBar)
    }
}

public extension View {
    func makeNavigationBar(backgroundColor: Color, height: NavigationBarHeight) -> some View {
        ZStack {
            Color.clear
                .ignoresSafeArea()
        NavigationStack {
            VStack(spacing: 0) {
                     self
                    .foregroundStyle(.white)
                    .frame(height: height.value)
                    .frame(maxWidth: .infinity)
                    .background(
                        backgroundColor.ignoresSafeArea(edges: .top)
                    )
            }
            .navigationBarBackButtonHidden(true)
        }
        }
    }

    func makeNavigationBar(path: Binding<NavigationPath>, backgroundColor: Color, height: NavigationBarHeight) -> some View {
        ZStack {
            Color.clear
                .ignoresSafeArea()
        NavigationStack(path: path) {
            VStack(spacing: 0) {
                     self
                    .foregroundStyle(.white)
                    .frame(height: height.value)
                    .frame(maxWidth: .infinity)
                    .background(
                        backgroundColor.ignoresSafeArea(edges: .top)
                    )
            }
            .navigationBarBackButtonHidden(true)
        }
        }
    }
}
#else
public extension NavFlowNavigationBarView {
    func hideNavFlowNavigationBar() -> some View { self }
}
#endif
