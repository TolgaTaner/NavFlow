# NavFlow

**NavFlow** is a Swift Package that provides customizable navigation containers and navigation bars for SwiftUI applications. You can easily add your own navigation bar view and use it with either **push** or **sheet** navigation flows.

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
    .package(url: "https://github.com/TolgaTaner/NavFlow.git", from: "1.1.4")
]
```
## 🔧 Usage

```swift
import SwiftUI
import NavFlow

struct ContentView: View {
    var body: some View {
        NavFlowNavigationContainerView(
            backgroundColor: .blue,
            height: StandardNavigationHeight(),
            navigationBarView: {
                Text("My Custom Navigation Bar")
                    .font(.headline)
                    .padding()
            },
            content: {
                VStack {
                    Text("Hello, World!")
                }
            }
        )
    }
}
```

## Push Navigation

```swift
NavFlowNavigationPushLink(
    color: .blue,
    navigationBarView: {
        Text("Detail Page")
            .font(.headline)
            .padding()
    },
    destination: Text("Destination View"),
    label: {
        Text("Go to Detail")
            .foregroundColor(.blue)
    }
)
```
## Sheet Navigation
```swift
NavFlowNavigationSheetLink(
    color: .red,
    navigationBarView: {
        Text("Sheet Title")
            .font(.headline)
            .padding()
    },
    destination: Text("Sheet Content"),
    label: {
        Text("Open Sheet")
            .foregroundColor(.red)
    }
)
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

🛠 Requirements
iOS 15+
Swift 5.9+

📄 License
MIT License

