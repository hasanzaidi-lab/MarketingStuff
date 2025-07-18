//
//  ActionBtnView.swift
//  July17WeeklyTests
//
//  Created by Hasan Zaidi on 7/17/25.
//

import SwiftUI

struct ActionBtnView: View {
    var body: some View {
        VStack(spacing: 12) {
            Button(action: {
                print("Modify tapped")
            }) {
                Text("Modify")
                    .font(.subheadline)
//                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.blue)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.blue, lineWidth: 1)
                    )
            }

            Button(action: {
                print("Remove tapped")
            }) {
                Text("Remove")
                    .font(.subheadline)
//                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.red)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.red, lineWidth: 1)
                    )
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ActionBtnView()
}
