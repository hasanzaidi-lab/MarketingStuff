//
//  CardDetialsView.swift
//  July17WeeklyTests
//
//  Created by Hasan Zaidi on 7/17/25.
//


import SwiftUI

struct CardDetialsView: View {
    let activityTitle: String
    let numGuests: Int
    let day: String
    let time: String
    let price: String  

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(activityTitle)
                    .font(.title2)
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Guest")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Text("Day")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Text("Time")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text("\(numGuests)")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Text("\(day)")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Text("\(time)")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                }
                
                PriceView(price: "$129")
                
            }
            VStack {
                ActionBtnView()
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
        .padding()
    }
}

#Preview {
    CardDetialsView(activityTitle: "String", numGuests: 3, day: "String", time: "String", price: "String")
}
