//
//  ContentView.swift
//  Example
//
//  Created by Tolga Taner on 2.09.2025.
//

import SwiftUI
import NavFlow

struct ContentView: View {
    @State private var path = NavigationPath()
    @State private var showingSheet = false
    private let products = Product.samples
    
    var body: some View {
        NavFlowNavigationBarView(backgroundColor: .blue,
                                  navigationBarHeight: StandardNavigationHeight(),
                                  navigationBarView: {
            
        }, content: {
            List(products) { product in
                NavFlowNavigationPushLink(
                    color: Color(red: 16/255, green: 30/255, blue: 40/255),
                    navigationHeight: StandardNavigationHeight(),
                    navigationBarView: {
                        StoreLocationBar(location: "Mondolibug, Sylhet", showsBack: true)
                    },
                    destination: ProductDetailView(product: product)
                ) {
                    HStack {
                        Text(product.name)
                        Spacer()
                        Text(String(format: "$%.0f", product.price))
                            .foregroundStyle(.secondary)
                    }
                }
            }
        })
        .hideNavFlowNavigationBar()

        
    }
}

#Preview {
    ContentView()
}
