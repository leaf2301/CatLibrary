//
//  ErrorView.swift
//  CatLibrary
//
//  Created by Tran Hieu on 14/05/2023.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var vm: DataFetcher
    
    var body: some View {
        VStack {
            Text("🙀")
                .font(.system(size: 80))
                .padding()
            Text(vm.errorMessage ?? "Sorry! There are some errors...")
            
            Button {
                vm.fetchData()
            } label: {
                Text("Try again".uppercased())
                    .font(.headline)
                    .frame(width: 120,height: 45)
                    .background(Color.gray.opacity(0.7))
                    .cornerRadius(10)
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(vm: DataFetcher())
    }
}
