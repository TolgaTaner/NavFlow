//
//  NavigationBarHeight.swift
//  NavFlow
//
//  Created by Tolga Taner on 29.08.2025.
//

#if canImport(UIKit)
import UIKit
#endif
import CoreGraphics

protocol NavigationBarHeight {
    var value: CGFloat { get set }
}

struct StandardNavigationHeight: NavigationBarHeight {
    var value: CGFloat
    
    init() {
        self.value = Self.getNavigationBarHeight()
    }
    
    private static func getNavigationBarHeight() -> CGFloat {
        #if canImport(UIKit)
        let statusBarHeight: CGFloat
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            statusBarHeight = window.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        } else {
            statusBarHeight = 0
        }
        let standardNavigationBarHeight: CGFloat = 44
        let deviceHeight = UIScreen.main.bounds.height
        let isDeviceWithNotch = deviceHeight >= 812
        if isDeviceWithNotch {
            return statusBarHeight + standardNavigationBarHeight
        }
        return standardNavigationBarHeight
        #else
        return 44
        #endif
    }
}

struct DynamicNavigationHeight: NavigationBarHeight {
    var value: CGFloat
    
    init(value: CGFloat) {
        self.value = value
    }
}
