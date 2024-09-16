//
//  SplashScreenView.swift
//  Shop App
//
//  Created by Fırat Ören on 11.09.2024.
//

import SwiftUI

struct SplashScreenView: View {
    @State var isAnimating = true
    var body: some View {
        VStack{
            Image("Logo")
                .resizable()
                .frame(width: 200,height: 200)
                .clipShape(Circle())
                .offset(y: isAnimating ? 600 : 0)
                .animation(Animation.linear(duration: 0.5))
        }.onAppear {
                isAnimating.toggle()
        }


    }
}

#Preview {
    SplashScreenView()
}
