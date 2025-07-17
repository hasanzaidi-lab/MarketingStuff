//
//  PriceView.swift
//  July17WeeklyTests
//
//  Created by Hasan Zaidi on 7/17/25.
//

import SwiftUI

struct PriceView: View {
    let price: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(price)
                .fontWeight(.bold)
            Button(action: { }) {
                Text("Price details >")
                    .foregroundColor(.blue)
                    .bold()
            }
        }
    }
}


#Preview() {
    PriceView(price: "dummy")
}
