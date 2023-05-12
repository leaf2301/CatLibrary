//
//  ContentView.swift
//  CatLibrary
//
//  Created by Tran Hieu on 12/05/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = DataFetcher()
    
    
    var body: some View {
        List {
            ForEach(vm.breeds) { breed in
                VStack {
                    Text(breed.name)
                    Text(breed.lifeSpan)
                    Text(breed.description)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
