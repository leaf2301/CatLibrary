//
//  APIService.swift
//  CatLibrary
//
//  Created by Tran Hieu on 13/05/2023.
//

import Foundation

struct APIService {
    
    func fetchData1(url: URL?, completion: @escaping(Result<[CatModel], APIError>) -> ()) {
        
        guard let url = url else {
            let error = APIError.badURL
            completion(.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error is URLError {
                completion(.failure(APIError.url))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(.failure(APIError.badResponse))
            } else if let data = data {
                do {
                    let items = try JSONDecoder().decode([CatModel].self, from: data)
                    completion(.success(items))
                } catch {
                    completion(.failure(APIError.parsing))
                }
            }
    
            
            
        }.resume()
    
        
    }
}
