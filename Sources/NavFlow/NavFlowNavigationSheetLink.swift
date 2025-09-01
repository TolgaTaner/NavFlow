//
//  NavFlowNavigationSheetLink.swift
//  NavFlow
//
//  Created by Tolga Taner on 29.08.2025.
//

import SwiftUI

public struct NavFlowNavigationSheetLink<Label: View, Destination: View, NavigationBarView: View>: View {
    
    let destination: Destination
    let label: Label
    let navigationBarView: NavigationBarView
    let color: Color
    @State private var isPresenting: Bool = false
    let height: NavigationBarHeight
    
    public init(color: Color,
                navigationHeight: NavigationBarHeight = StandardNavigationHeight(),
        @ViewBuilder navigationBarView: () -> NavigationBarView,
         destination: Destination,
         @ViewBuilder label: () -> Label) {
        self.navigationBarView = navigationBarView()
        self.destination = destination
        self.label = label()
        self.color = color
        self.height = navigationHeight
    }
    
    public var body: some View {
        Button {
            isPresenting = true
        } label: {
            label
        }
        .sheet(isPresented: $isPresenting) {
            ZStack(alignment: .top) {
                Color.clear
                    .ignoresSafeArea()
                VStack(spacing: 0) {
                    navigationBarView
                        .frame(height: height.value)
                        .frame(maxWidth: .infinity)
                        .background(
                            color.ignoresSafeArea(edges: .top)
                        )
                    destination
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .navigationBarBackButtonHidden(true)
        }
    }
}
