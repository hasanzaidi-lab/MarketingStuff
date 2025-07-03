//
//  CountriesViewModel.swift
//  CountriesList
//
//  Created by Hasan Zaidi on 7/2/25.
//

import Foundation
import Combine

class CountriesViewModel: ObservableObject {
    @Published var countries: [Country] = []
    @Published var error: Error?
    
    func fetchCountries() async {
        do {
            let url = URL(string: "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json")!
            countries = try await NetworkManager.shared.fetchData(from: url, type: [Country].self)
            print("countries")
        } catch {
            self.error = error
        }
    }
}
