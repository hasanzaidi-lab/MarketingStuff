//
//  HeaderView.swift
//  July17WeeklyTests
//
//  Created by Hasan Zaidi on 7/17/25.
//

import SwiftUI

struct HeaderView: View {
    let dayNumber: Int
    let shipTime: String
    let onClose: () -> Void

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ZStack {
                    HStack {
                        Spacer()
                        Button(action: onClose) {
                            Image(systemName: "xmark")
                                .font(.title2)
                                .foregroundColor(.blue)
                        }
                    }
                    
                    VStack(spacing: 4) {
                        Text("Day \(dayNumber) • Ships at \(shipTime)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text("Cart")
                            .font(.title2)
                            .bold()
                    }
                }
                .padding()
                .background(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)

                Divider()
                // Your list can go here
            }
            .navigationBarHidden(true)
        }
    }
}


#Preview {
    HeaderView(dayNumber: 3, shipTime: "3 PM") {
        print("Close tapped")
    }
}
