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
        if vm.isLoading {
            LoadingView()
        } else if vm.errorMessage != nil {
            ErrorView(vm: vm)
        } else {
            CatList(breeds: vm.breeds)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
