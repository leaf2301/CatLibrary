//
//  CatList.swift
//  CatLibrary
//
//  Created by Tran Hieu on 14/05/2023.
//

import SwiftUI

struct CatList: View {
    let breeds: [CatModel]
    
    @State private var searchText: String = ""
    var filterBreed: [CatModel] {
        if searchText.count == 0 {
            return breeds
        } else {
            return breeds.filter{ $0.name.contains(searchText)}
        }
    }
    var body: some View {
        NavigationView {
            List {
                ForEach(filterBreed) { breed in
                    NavigationLink {
                        DetailView(breed: breed)
                    } label: {
                        CatItem(breed: breed)
                    }
                    
                }
            }
            .listStyle(.plain)
            .navigationTitle("Find Your PerFect Cat")
            .searchable(text: $searchText)
        }
    }
    
}

struct CatList_Previews: PreviewProvider {
    
    static var previews: some View {
        CatList(breeds: DataFetcher.successState().breeds)
    }
}
