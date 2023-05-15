//
//  CatItem.swift
//  CatLibrary
//
//  Created by Tran Hieu on 14/05/2023.
//

import SwiftUI

struct CatItem: View {
    let breed: CatModel
    let imageSize: CGFloat = 100
    
    var body: some View {
        HStack {
            if breed.referenceId != nil {
                AsyncImage(url: URL(string: try! getImage())) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: imageSize, height: imageSize)
                            .clipped()
                    } else if phase.error != nil {
                        Text(phase.error?.localizedDescription ?? "error")
                            .foregroundColor(.pink)
                            .frame(width: imageSize, height: imageSize)

                    } else {
                        ProgressView()
                            .frame(width: imageSize, height: imageSize)

                    }
                    
                }
            } else {
                Color.gray
                    .frame(width: imageSize, height: imageSize)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(breed.name)
                    .font(.headline)
                Text(breed.temperament)
            }
        }
    }
    
    func getImage() throws -> String {
        if let id = breed.referenceId {
            let url = "https://cdn2.thecatapi.com/images/" + "\(id)" + ".jpg"
            
            return url
        }
        
        throw URLError(.badURL)
    }
}

struct CatItem_Previews: PreviewProvider {
    static var previews: some View {
        CatItem(breed: CatModel.example)
    }
}
