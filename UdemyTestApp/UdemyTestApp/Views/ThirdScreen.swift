//
//  ThirdScreen.swift
//  UdemyTestApp
//
//  Created by Hasan Zaidi on 7/15/25.
//


import SwiftUI
 
struct ThirdScreen: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.red)
                .opacity(0.3)
            Text("jsdbhf")
        }.frame(width: 200, height: 222)
    }
}

#Preview {
    ThirdScreen()
}
