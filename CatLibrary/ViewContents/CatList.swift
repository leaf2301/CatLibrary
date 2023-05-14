//
//  CatList.swift
//  CatLibrary
//
//  Created by Tran Hieu on 14/05/2023.
//

import SwiftUI

struct CatList: View {
    let breeds: [CatModel]
    
    
    var body: some View {
        ScrollView {
            List {
                ForEach(breeds) { breed in
                    NavigationLink {
                        DetailView(breed: CatModel.example)
                    } label: {
                        CatItem(breed: CatModel.example)
                    }
                    
                }
            }
        }
    }
}

struct CatList_Previews: PreviewProvider {
    
    
    static var previews: some View {
        CatList(breeds: DataFetcher.successState().breeds)
    }
}
