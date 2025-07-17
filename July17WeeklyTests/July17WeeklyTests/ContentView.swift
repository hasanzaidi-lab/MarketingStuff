//
//  ContentView.swift
//  July17WeeklyTests
//
//  Created by Hasan Zaidi on 7/17/25.
//

import SwiftUI

struct ContentView: View {
    let headerHeight: CGFloat = 120
    
    var body: some View {
        GeometryReader { proxy in
            let _ = proxy.safeAreaInsets.top
            let _ = proxy.safeAreaInsets.bottom

            ZStack(alignment: .top) {
                VStack(spacing: 0) {
                    Spacer(minLength: headerHeight-50) // Pushes ScrollView below header
                    
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(0..<5) { index in
                                CardDetialsView(
                                    activityTitle: "Kayaking Adventure \(index + 1)",
                                    numGuests: 2,
                                    day: "Saturday",
                                    time: "2:00 PM",
                                    price: "$129"
                                )
                            }

                            Spacer(minLength: 100) // Space for BottomBarView to float above
                        }
                        .padding(.horizontal)
                    }

                    BottomBarView()
                }

                // Sticky Header
                HeaderView(dayNumber: 2, shipTime: "3 PM", onClose: {
                    print("Close tapped")
                })
                .frame(height: headerHeight)
                .background(Color(.systemBackground))
                .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
                .ignoresSafeArea(edges: .top)
            }
        }
    }
}

#Preview {
    ContentView()
}
