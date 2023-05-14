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
    private let url = URL(string: "https://api.thecatapi.com/v1/breeds")
   
    init() {
        fetchData()
    }
    
    func fetchData()  {
        isLoading = false
        errorMessage = nil
        
        let service = APIService()
        service.fetchData1(url: url) { [weak self] result in
            DispatchQueue.main.async {
                
                self?.isLoading = true
                switch result {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                case .success(let breeds):
                    self?.breeds = breeds
                }
            }
        }
        
    }
    
    static func successState() -> DataFetcher {
        let fetcher = DataFetcher()
        fetcher.breeds = [CatModel.example]
        return fetcher
    }
    
    static func errorState() -> DataFetcher {
        let fetcher = DataFetcher()
        fetcher.errorMessage = APIError.badURL.userLocalizedDescription
        return fetcher
    }
    
    
}
