//
//  DataItemModel.swift
//  UdemyTestApp
//
//  Created by Hasan Zaidi on 7/15/25.
//

import Foundation

struct DataItemModel: Identifiable {
    var id = UUID()
    var title: String
    var description: String
}
