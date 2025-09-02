import SwiftUI

struct StoreLocationBar: View {
    @Environment(\ .dismiss) private var dismiss
    let title: String = "Store location"
    let location: String
    let showsBack: Bool

    init(location: String, showsBack: Bool = false) {
        self.location = location
        self.showsBack = showsBack
    }

    var body: some View {
        HStack(spacing: 16) {
            // Left side: back or menu
            if showsBack {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .font(.title3)
                }
            } else {
                Button(action: {}) {
                    Image(systemName: "circle.grid.2x2.fill")
                        .font(.title3)
                }
            }

            Spacer()

            // Center location
            VStack(spacing: 2) {
                Text(title)
                    .font(.caption2)
                    .opacity(0.7)
                HStack(spacing: 4) {
                    Image(systemName: "mappin.and.ellipse")
                        .font(.caption)
                    Text(location)
                        .font(.footnote)
                        .bold()
                }
            }

            Spacer()

            // Right bag with dot
            ZStack(alignment: .topTrailing) {
                Button(action: {}) {
                    Image(systemName: "bag")
                        .font(.title3)
                }
                Circle()
                    .fill(Color.red)
                    .frame(width: 6, height: 6)
                    .offset(x: 2, y: -2)
            }
        }
        .padding(.horizontal)
        .foregroundStyle(.white)
    }
}


