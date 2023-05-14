//
//  DetailView.swift
//  CatLibrary
//
//  Created by Tran Hieu on 14/05/2023.
//

import SwiftUI

struct DetailView: View {
    let breed: CatModel
    let imageSize: CGFloat = 300
    var body: some View {
        ScrollView {
            VStack {
                if breed.image?.url != nil {
                    AsyncImage(url: URL(string: breed.image!.url!)) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame( height: imageSize)
                                .clipped()
                        } else if phase.error != nil {
                            Text(phase.error?.localizedDescription ?? "error")
                                .foregroundColor(.pink)
                                .frame(height: imageSize)

                        } else {
                            ProgressView()
                                .frame(height: imageSize)

                        }
                        
                    }
                } else {
                    Color.gray
                        .frame(height: imageSize)
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text(breed.name)
                        .font(.headline)
                    Text(breed.temperament)
                        .font(.footnote)
                    Text(breed.description)
                    Text("Life span: \(breed.lifeSpan) years")
                    if breed.isHairless {
                        Text("Hairless")
                    }
                    VStack(spacing: 5) {
                        HStack {
                            Text("Energy Level")
                                .bold()
                            Spacer()
                            ForEach(1..<6) { number in
                                Image(systemName: "star.fill")
                                    .foregroundColor(breed.energyLevel > number ? Color.accentColor : Color.gray)
                            }
                        }
                        HStack {
                            Text("Children Friendly")
                                .bold()
                            Spacer()
                            ForEach(1..<6) { number in
                                Image(systemName: "star.fill")
                                    .foregroundColor(breed.childFriendly > number ? Color.accentColor : Color.gray)
                            }
                        }
                    }
                    
                    Spacer()
                }
                .padding()
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(breed: CatModel.example)
    }
}
