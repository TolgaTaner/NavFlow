import SwiftUI
import NavFlow

@main
struct NavFlowExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ExampleRootView()
        }
    }
}

struct ExampleRootView: View {
    var body: some View {
        VStack(spacing: 24) {
            Text("NavFlow Example")
                .font(.title.bold())
            NavFlowNavigationPushLink(color: .blue, navigationBarView: {
                HStack {
                    Text("Details")
                        .font(.headline)
                        .padding(.leading)
                    Spacer()
                }
            }, destination: ExampleDetailView()) {
                Text("Push to Details")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.15))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }

            NavFlowNavigationSheetLink(color: .purple, navigationBarView: {
                HStack {
                    Text("Sheet")
                        .font(.headline)
                        .padding(.leading)
                    Spacer()
                }
            }, destination: ExampleDetailView()) {
                Text("Present Sheet")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.purple.opacity(0.15))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
        .padding()
    }
}

struct ExampleDetailView: View {
    var body: some View {
        List {
            ForEach(0..<20, id: \.self) { index in
                Text("Row #\\(index)")
            }
        }
    }
}


