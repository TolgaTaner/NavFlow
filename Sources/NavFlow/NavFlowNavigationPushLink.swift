//
//  NavFlowNavigationPushLink.swift
//  NavFlow
//
//  Created by Tolga Taner on 26.03.2025.
//

import SwiftUI

public struct NavFlowNavigationPushLink<Label: View, Destination: View, NavigationBarView: View>: View {
    
    let destination: Destination
    let label: Label
    let navigationBarView: NavigationBarView
    let color: Color
    
    public init(color: Color,
        @ViewBuilder navigationBarView: () -> NavigationBarView,
         destination: Destination,
         @ViewBuilder label: () -> Label) {
        self.navigationBarView = navigationBarView()
        self.destination = destination
        self.label = label()
        self.color = color
    }
    
    public var body: some View {
        NavigationLink {
            ZStack(alignment: .top) {
                Color.clear
                    .ignoresSafeArea()
                VStack(spacing: 0) {
                    navigationBarView
                        .frame(height: StandardNavigationHeight().value)
                        .frame(maxWidth: .infinity)
                        .background(
                            color.ignoresSafeArea(edges: .top)
                        )
                    destination
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .navigationBarBackButtonHidden(true)
        } label: {
            label
        }
    }
}
