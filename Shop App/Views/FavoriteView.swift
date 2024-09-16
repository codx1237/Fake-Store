//
//  FavoriteView.swift
//  Shop App
//
//  Created by Fırat Ören on 5.09.2024.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

struct FavoriteView: View {

    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("Favorite Products")
                    .foregroundStyle(Color.black)
                    .bold()
                    .font(.title2)
                Spacer()
            }.padding(.top)

            ScrollView {
                VStack{
                    ForEach(0 ..< 3) { item in
                        HStack(alignment:.top){
                            Image("Shoes")
                                .resizable()
                                .frame(width: 150,height: 150)
                                .overlay {
                                    ZStack(alignment:.topTrailing){
                                        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10), style: .circular).stroke(Color.black,lineWidth: 1.0).opacity(0.2)
                                    }
                                }

                            VStack(alignment:.leading,spacing: 10){
                                HStack{
                                    Text("Shoes Casual Sport")
                                        .font(.system(size: 15)).bold()
                                    Spacer()
                                    Button(action: {}, label: {
                                        Image(systemName: "heart")
                                            .foregroundStyle(Color.orange)
                                            .font(.system(size: 21))
                                            .bold()
                                            .padding(.trailing)
                                    })
                                }

                                Text("Women's Shoes").opacity(0.5).font(.system(size: 13))
                                Spacer()
                                Text("999 ₺").bold().font(.system(size: 24)).padding(.bottom)
                            }
                            Spacer()
                        }.padding(.leading)
                        Divider()
                    }
                }
            }


        }






    }
}

#Preview {
    FavoriteView()
}
