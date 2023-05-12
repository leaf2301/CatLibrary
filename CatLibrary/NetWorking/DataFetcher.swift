//
//  DataFetcher.swift
//  CatLibrary
//
//  Created by Tran Hieu on 12/05/2023.
//

import Foundation

class DataFetcher: ObservableObject {
    @Published var breeds = [CatModel]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    init() {
        Task {
            await fetchData()
        }
    }
    
    func fetchData() async {
        guard let url = URL(string: "https://api.thecatapi.com/v1/breeds?limit=9") else {
            print("Bad URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let items = try JSONDecoder().decode([CatModel].self, from: data)
            await MainActor.run {
                self.breeds = items
            }
            print(items)

        } catch {
            
            print("Error")
        }
        
        
    }
    
}
