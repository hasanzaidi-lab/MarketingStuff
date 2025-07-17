//
//  BottomBarView.swift
//  July17WeeklyTests
//
//  Created by Hasan Zaidi on 7/17/25.
//

import SwiftUI

struct BottomBarView: View {
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Button(action: { }) {
                    Text("Order Summary")
                        .font(.headline)
                }

                Spacer()

                Text("$123.45")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .padding()

            Button(action: {}) {
                Text("Checkout")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    BottomBarView()
}
