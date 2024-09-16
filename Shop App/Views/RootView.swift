//
//  RootView.swift
//  Shop App
//
//  Created by Fırat Ören on 5.09.2024.
//

import SwiftUI

struct RootView: View {
    @State private var selectedTab: Tab = .home
    @State var isSplashScreen = true
    var body: some View {

            VStack{
                if isSplashScreen {
                    SplashScreenView()
                } else {
                    Spacer()
                    switch selectedTab {
                    case .home:
                        HomePageView()
                    case .cart:
                        ShopCartView()
                    case .favorite:
                        FavoriteView()
                    case .profile:
                        ProfileView()
                    }
                    Spacer()
                    myTab(selectedTab: $selectedTab)
                }

            }.edgesIgnoringSafeArea(.bottom)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        isSplashScreen.toggle()
                    }
                }
            }


    }
}

#Preview {
    RootView()
}


struct myTab: View {
    @Binding var selectedTab: Tab
    var body: some View {
        VStack {
            HStack{
                    Spacer()
                    TabbarButton(icon: "house", tab: .home, selectedTab: $selectedTab)
                    Spacer()
                    TabbarButton(icon: "cart", tab: .cart, selectedTab: $selectedTab)
                    Spacer()
                    TabbarButton(icon: "heart", tab: .favorite, selectedTab: $selectedTab)
                    Spacer()
                    TabbarButton(icon: "person", tab: .profile, selectedTab: $selectedTab)
                    Spacer()
                }
                .padding(10)
                .frame(maxWidth: .infinity)
                .background(Color.orange)
                .cornerRadius(20)
                .shadow(radius: 10)
        }.edgesIgnoringSafeArea(.all)


    }
}

struct TabbarButton: View {
    let icon: String
    let tab: Tab
    @Binding var selectedTab: Tab
    var body: some View {
        Button(action: {
            selectedTab = tab
        }, label: {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(selectedTab == tab ? Color.white : Color.black)
                .padding()
        })
    }
}


enum Tab {
    case home
    case cart
    case favorite
    case profile
}
