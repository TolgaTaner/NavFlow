//
//  NavFlowNavigationSheetLink.swift
//  NavFlow
//
//  Created by Tolga Taner on 29.08.2025.
//

import SwiftUI

struct NavFlowNavigationSheetLink<Label: View, Destination: View, NavigationBarView: View>: View {
    
    let destination: Destination
    let label: Label
    let navigationBarView: NavigationBarView
    let color: Color
    @State private var isPresenting: Bool = false
    
    init(color: Color,
        @ViewBuilder navigationBarView: () -> NavigationBarView,
         destination: Destination,
         @ViewBuilder label: () -> Label) {
        self.navigationBarView = navigationBarView()
        self.destination = destination
        self.label = label()
        self.color = color
    }
    
    var body: some View {
        Button {
            isPresenting = true
        } label: {
            label
        }
        .sheet(isPresented: $isPresenting) {
            NavFlowNavigationContainerView(backgroundColor: color, height: StandardNavigationHeight(), navigationBarView: { navigationBarView }) {
                destination
            }
        }
    }
}
