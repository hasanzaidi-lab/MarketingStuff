//
//  Untitled.swift
//  UdemyTestApp
//
//  Created by Hasan Zaidi on 7/15/25.
//

import SwiftUI

struct SecondScreen: View {
    
    let mesages: [DataItemModel] = [
        .init(title: "sdfjn", description: "kjdsfn"),
        .init(title: "blah", description: "kjdsfn"),
        .init(title: "dfkjnv", description: "kjdsfn"),
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 1.0) {
            ForEach(mesages) { mesage in
                /*@START_MENU_TOKEN@*/Text(mesage.title)/*@END_MENU_TOKEN@*/
                    .foregroundColor(.orange)
                    .font(.headline)
                    .bold(true)
                Text(mesage.description)
                    .font(.caption)
                    .fontWeight(.light)
                    .padding(.bottom, 10)
            }
        }
        .padding()
    }
}

#Preview() {
    SecondScreen()
}
