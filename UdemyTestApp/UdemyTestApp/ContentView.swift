//
//  ContentView.swift
//  UdemyTestApp
//
//  Created by Hasan Zaidi on 7/14/25.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Home View")
                NavigationLink("Go to Detail", destination: DetailView())
            }
            .navigationTitle("Dashboard")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Edit") {
                        print("Edit tapped")
                    }
                }
            }
        }
    }
}

struct DetailView: View {
    var body: some View {
        Text("Detail View")
            .navigationTitle("Details")
            .navigationBarTitleDisplayMode(.large)
    }
}


#Preview {
    ContentView()
}
