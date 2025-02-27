//
//  ContentView.swift
//  swiftui-pro
//
//  Created by lw h on 2025/2/27.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var showingAlert=false;
    var body: some View {
        Button(
            action: {
                showingAlert=true;
            },
            label: {
                Text("点击")
            }
        )  .alert("Important message", isPresented: $showingAlert) {
            Button("OK", role: .cancel) {
                showingAlert=false;
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
