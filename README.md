# NavFlow

**NavFlow** is a Swift Package that provides customizable navigation containers and navigation bars for SwiftUI applications. You can easily add your own navigation bar view and use it with either **push** or **sheet** navigation flows.

## Overview

### Navigation bar screenshots designed with NavFlow

<p align="center">
  <img src="https://github.com/user-attachments/assets/5c1c6c03-abe9-419c-bd17-8c1de26507a0" alt="Screenshot 1" width="180" />
  <img src="https://github.com/user-attachments/assets/315235be-ab5e-4b55-b7c7-f47502b30ea8" alt="Screenshot 4" width="180" />
  <img src="https://github.com/user-attachments/assets/e3251ac2-4bf8-417f-aac8-83c4402fccc0" alt="Screenshot 2" width="180" />
  <img width="180" src="https://github.com/user-attachments/assets/b9063730-1325-48ef-8bff-ee3fdfe3a68f" alt="Screenshot 5" />
</p>


## ✨ Features

- 🚀 **Custom Navigation Bar** — Provide any SwiftUI view as a navigation bar.  
- 📱 **iOS Support** — Includes UIKit-based navigation bar height calculation.  
- 🔄 **Push & Sheet Navigation** — Works with both `NavigationLink` and `.sheet`.  
- 📏 **Dynamic or Standard Height** — Use `StandardNavigationHeight` or `DynamicNavigationHeight`.  

## 📦 Installation

### Swift Package Manager (SPM)

In Xcode: Go to **File → Add Packages…** and enter the repo URL:

```swift
https://github.com/TolgaTaner/NavFlow.git
```
Or add it directly to your **Package.swift:**
```swift
dependencies: [
    .package(url: "https://github.com/TolgaTaner/NavFlow.git", from: "1.2.3")
]
```
## 🔧 Usage

```swift
import NavFlow
import SwiftUI

struct ContentView: View {
 @State private var navigationPath = NavigationPath()

 var body: some View {
     NavFlowNavigationBarView(
         path: $navigationPath,
         backgroundColor: .blue,
         navigationBarHeight: StandardNavigationHeight()
     ) {
        /// Custom View For Navigation Bar
         HStack {
             Text("Back").foregroundColor(.white)
             Spacer()
             Text("Home").bold().foregroundColor(.white)
             Spacer()
             Button("Edit") { /* action */ }.foregroundColor(.white)
         }
     } content: {
         VStack {
             Text("Main content here")
                 .padding()
         }
     }
 }
}
```

## Push Navigation

```swift
import SwiftUI
import NavFlow

struct PushExampleView: View {
    var body: some View {
        NavFlowNavigationPushLink(
            color: .blue,
            navigationHeight: StandardNavigationHeight(),
            navigationBarView: {
                HStack {
                    Text("Custom Nav")
                        .bold()
                        .foregroundColor(.white)
                    Spacer()
                    Button("Action") { /* do something */ }
                        .foregroundColor(.white)
                }
            },
            destination: Text("Destination Page")
        ) {
            Text("Go to Destination")
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
        }
    }
}
```
## Sheet Navigation
```swift
NavFlowNavigationSheetLink(
    color: .purple,
    navigationBarView: {
        Text("Sheet View").foregroundColor(.white)
    },
    destination: Text("This is a sheet")
) {
    Text("Open Sheet")
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(8)
}
```
## 📏 Navigation Bar Height

NavFlow manages bar height through the **NavigationBarHeight** protocol.

### Standard Height (status bar + nav bar, notch-aware):
```swift
let height = StandardNavigationHeight()
```
### Custom Dynamic Height:
```swift
let customHeight = DynamicNavigationHeight(value: 100)
```

### Hiding Navigation Bar:

If you want, you can hide navigation bar, but you can still use its features.

```swift
NavFlowNavigationBarView(
    backgroundColor: .black,
    navigationBarHeight: StandardNavigationHeight(),
    navigationBarView: { CustomBar() },
    content: { OnboardingView() }
)
.hideNavFlowNavigationBar()
```
🛠 Requirements
iOS 16+
Swift 5.9+

📄 License
MIT License

