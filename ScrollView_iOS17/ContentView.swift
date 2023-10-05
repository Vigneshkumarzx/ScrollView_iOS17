//
//  ContentView.swift
//  ScrollView_iOS17
//
//  Created by vignesh kumar c on 05/10/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(MockData.items) { item in
                    Circle()
                        .containerRelativeFrame(.horizontal, count: 1, spacing: 16)
                        .foregroundStyle(item.color.gradient)
                        .scrollTransition { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1.0 : 0.0)
                                .scaleEffect(x: phase.isIdentity ? 1.0 : 0.3,
                                             y: phase.isIdentity ? 1.0 : 0.3)
                                .offset(y: phase.isIdentity ? 0 : 50)
                        }
                }
            }
            .scrollTargetLayout()
        }
        .contentMargins(16, for: .scrollContent)
        .scrollTargetBehavior(.viewAligned)
    }
}

#Preview {
    ContentView()
}


struct Item: Identifiable {
    let id = UUID()
    let color: Color
}

struct MockData {
    static var items = [
        Item(color: .teal),
        Item(color: .pink),
        Item(color: .indigo),
        Item(color: .orange),
        Item(color: .purple),
        Item(color: .yellow),
        Item(color: .red),
        Item(color: .brown),
        Item(color: .blue)
    ]
}
