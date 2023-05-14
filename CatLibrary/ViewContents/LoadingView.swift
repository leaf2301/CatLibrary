//
//  LoadingView.swift
//  CatLibrary
//
//  Created by Tran Hieu on 14/05/2023.
//

import SwiftUI

struct LoadingView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.red, .yellow]), center: .center, startRadius: 100, endRadius: 500)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("😻")
                    .font(.system(size: 80))
                    .padding(.vertical, animate ? 30 : 50)
                    .shadow(color: animate ? Color.gray.opacity(0.5) : Color.gray.opacity(0.1), radius: animate ? 30 : 10, x: 0, y: 50)
                    .scaleEffect(animate ? 2.0  : 0.9)
                    .offset(y: animate ? -7 : 0)
                    .onAppear(perform: addAnimation)

                Spacer()
                ProgressView()
                    .padding()
                
                Text("The cat library is prepared ...".uppercased())
                    .bold()
                
            }
        }
    }
    
    func addAnimation() {
        guard !animate else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 2.0).repeatForever()) {
                animate.toggle()
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
