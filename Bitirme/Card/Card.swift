//
//  Card.swift
//  Bitirme
//
//  Created by Başak Ertuğrul on 1.05.2021.
//

import SwiftUI

struct CardView: View {
    @Binding var title: String

    var body: some View {
        ZStack {
            Color.white
                .cornerRadius(8)
            Text(title)
        }
        .frame(width: 150, height: 200)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 0)
    }
}

struct CardViews: View {
    @State var items: [String]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 15) {
                ForEach(0..<items.count) {
                    CardView(title: self.$items[$0])
                }
            }
            .padding()
        }
    }
}
