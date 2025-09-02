import Foundation

struct Product: Identifiable, Hashable {
    let id: UUID
    let name: String
    let price: Double
}

extension Product {
    static let samples: [Product] = [
        .init(id: UUID(), name: "Nike Air", price: 129.0),
        .init(id: UUID(), name: "Adidas Runner", price: 119.0),
        .init(id: UUID(), name: "Puma Speed", price: 99.0),
        .init(id: UUID(), name: "New Balance 990", price: 199.0)
    ]
}


