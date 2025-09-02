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
#else
public extension NavFlowNavigationBarView {
    func hideNavFlowNavigationBar() -> some View { self }
}
#endif


